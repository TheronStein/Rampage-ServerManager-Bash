#!/bin/bash
# Define paths
export PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WEEKNUM=0

Setup_EnvironmentVars() {
    export SERVER_MANAGER="${SERVER_MANAGER:-$PROJECT_ROOT}"
    export UTILS_DIR="${SERVER_MANAGER_UTILS:-$SERVER_MANAGER/utils}"
    export DATA_DIR="${SERVER_MANAGER_DATA:-$SERVER_MANAGER/data}"
    export LOG_DIR="${SERVER_MANAGER_LOGS:-$SERVER_MANAGER/logs}"
    export BOOT_LOG="$LOG_DIR/server-manager.log"
    export FALLBACK_LOG_FILE="/var/log/server-manager.log"

    # Define subdirectories
    export DEFDIR="$UTILS_DIR/defs"
    export FUNCDIR="$UTILS_DIR/funcs"
    export HANDIR="$UTILS_DIR/handlers"
}

Create_Logs() {
    # Create log directory if it doesn't exist
    if [[ ! -d "$LOG_DIR" ]]; then
        mkdir -p "$LOG_DIR" 2>/dev/null || {
            echo "[$(date)] Failed to create log directory: $LOG_DIR" >>"$FALLBACK_LOG_FILE"
            LOG_DIR="/var/log"
            BOOT_LOG="/var/log/server-manager.log"
        }
    fi

    # Create log files
    for log_file in "$BOOT_LOG" "$FALLBACK_LOG_FILE"; do
        if [[ ! -f "$log_file" ]]; then
            touch "$log_file" 2>/dev/null || echo "Failed to create $log_file"
        fi
    done

    # Initial log entry
    echo "[$(date)] Server Manager started - PID: $$" >>"$BOOT_LOG"
}

Log_Message() {
    local message="$1"
    local level="${2:-INFO}"
    local timestamp="[$(date '+%Y-%m-%d %H:%M:%S')]"

    echo "$timestamp [$level] $message" >>"$BOOT_LOG"
    echo "$timestamp [$level] $message" >>"$FALLBACK_LOG_FILE"

    # Also output to stdout if running interactively
    if [[ -t 1 ]]; then
        echo "$timestamp [$level] $message"
    fi
}

Check_Sources() {
    if [[ -z "$SERVER_MANAGER" ]]; then
        Log_Message "SERVER_MANAGER environment variable is not set" "ERROR"
        return 1
    fi

    if [[ ! -d "$SERVER_MANAGER" ]]; then
        Log_Message "SERVER_MANAGER directory does not exist at $SERVER_MANAGER" "ERROR"
        return 1
    fi

    return 0
}

Source_Project() {
    # Check required directories
    local REQUIRED_DIRS=("$UTILS_DIR" "$DATA_DIR" "$LOG_DIR" "$DEFDIR" "$FUNCDIR" "$HANDIR")

    for dir in "${REQUIRED_DIRS[@]}"; do
        if [[ ! -d "$dir" ]]; then
            Log_Message "Required directory missing: $dir" "ERROR"
            return 1
        fi
    done

    Log_Message "All required directories found" "INFO"
    return 0
}

Source_Utils() {
    # Source definition files first
    local def_files=("configs.sh" "wadlist.sh" "hostnames.sh")
    for file in "${def_files[@]}"; do
        local full_path="$DEFDIR/$file"
        if [[ -f "$full_path" ]]; then
            source "$full_path"
            Log_Message "Sourced definition file: $file" "INFO"
        else
            Log_Message "Definition file not found: $full_path" "ERROR"
            return 1
        fi
    done

    # Source function files
    local func_files=("screens.sh" "servers.sh" "windows.sh")
    for file in "${func_files[@]}"; do
        local full_path="$FUNCDIR/$file"
        if [[ -f "$full_path" ]]; then
            source "$full_path"
            Log_Message "Sourced function file: $file" "INFO"
        else
            Log_Message "Function file not found: $full_path" "ERROR"
            return 1
        fi
    done

    # Source handler files
    local handler_files=("boot-start.sh" "server-health-check.sh")
    for file in "${handler_files[@]}"; do
        local full_path="$HANDIR/$file"
        if [[ -f "$full_path" ]]; then
            source "$full_path"
            Log_Message "Sourced handler file: $file" "INFO"
        else
            # Health check is optional
            if [[ "$file" != "server-health-check.sh" ]]; then
                Log_Message "Handler file not found: $full_path" "ERROR"
                return 1
            else
                Log_Message "Optional health check file not found: $full_path" "WARN"
            fi
        fi
    done

    return 0
}

# Handle arguments
ARG1="$1"
ARG2="$2"

Program_Start() {
    Log_Message "Program started with arguments: ARG1=$ARG1, ARG2=$ARG2" "INFO"

    case "$ARG1" in
    1)
        Log_Message "Starting Boot Server Process" "INFO"
        Boot_Server_Proc
        Program_Exit 0
        ;;
    2)
        Log_Message "Starting Hourly Check Process" "INFO"
        Hourly_Check_Proc
        Program_Exit 0
        ;;
    3)
        VENG_WEEKNUM="${ARG2:-$WEEKNUM}"
        Log_Message "Starting Vengeance Servers with week: $VENG_WEEKNUM" "INFO"
        Boot_Servers_Veng "$VENG_WEEKNUM"
        Program_Exit 0
        ;;
    4)
        VENG_WEEKNUM="${ARG2:-$WEEKNUM}"
        Log_Message "Starting All Servers with week: $VENG_WEEKNUM" "INFO"
        Boot_Server_Proc
        Boot_Servers_Veng "$VENG_WEEKNUM"
        Program_Exit 0
        ;;
    5)
        Log_Message "Checking Server Status" "INFO"
        Check_Server_Status
        Program_Exit 0
        ;;
    6)
        Log_Message "Running Health Check" "INFO"
        if command -v show_server_health_status &>/dev/null; then
            show_server_health_status
        else
            Log_Message "Health check not available" "WARN"
        fi
        Program_Exit 0
        ;;
    7)
        Log_Message "Running Enhanced Hourly Check" "INFO"
        if command -v Enhanced_Hourly_Check &>/dev/null; then
            Enhanced_Hourly_Check
        else
            Log_Message "Enhanced health check not available - running standard check" "WARN"
            Hourly_Check_Proc
        fi
        Program_Exit 0
        ;;
    "monitor")
        Log_Message "Starting server monitor mode" "INFO"
        if command -v monitor_servers &>/dev/null; then
            monitor_servers "${ARG2:-60}"
        else
            Log_Message "Monitor function not available" "ERROR"
        fi
        Program_Exit 0
        ;;
    "force-restart")
        Log_Message "Force restart requested - killing all sessions" "WARN"
        tmux kill-server 2>/dev/null
        sleep 2
        Boot_Server_Proc
        if [[ -n "$ARG2" ]]; then
            Boot_Servers_Veng "$ARG2"
        fi
        Program_Exit 0
        ;;
    "")
        Log_Message "No argument provided - exiting" "WARN"
        Program_Exit 1
        ;;
    *)
        Log_Message "Invalid argument: $ARG1" "ERROR"
        Log_Message "Valid options: 1, 2, 3 [week], 4 [week], 5, 6, 7, monitor [interval], force-restart [week]" "INFO"
        Program_Exit 1
        ;;
    esac
}

Program_Exit() {
    local exit_code="${1:-0}"
    Log_Message "Program exiting with code: $exit_code" "INFO"
    exit $exit_code
}

# Main execution
Log_Message "=== SERVER MANAGER STARTUP ===" "INFO"
Log_Message "Running from: $PROJECT_ROOT" "INFO"
Log_Message "User: $(whoami)" "INFO"
Log_Message "PATH: $PATH" "INFO"

Setup_EnvironmentVars
Create_Logs

if ! Check_Sources; then
    Log_Message "Source check failed" "ERROR"
    Program_Exit 1
fi

if ! Source_Project; then
    Log_Message "Project source failed" "ERROR"
    Program_Exit 1
fi

if ! Source_Utils; then
    Log_Message "Utils source failed" "ERROR"
    Program_Exit 1
fi

Program_Start
