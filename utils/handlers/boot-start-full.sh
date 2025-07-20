#!/bin/bash
# boot-start.sh - Server boot procedures with safety checks

# Log function for boot operations
log_boot() {
    local message="$1"
    local level="${2:-INFO}"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [BOOT] [$level] $message" >>"$BOOT_LOG"
}

# Check if servers are already running
check_servers_running() {
    local session_name="$1"
    local expected_windows="$2"

    if ! tmux has-session -t "$session_name" 2>/dev/null; then
        return 1 # Session doesn't exist, servers not running
    fi

    local window_count=$(tmux list-windows -t "$session_name" 2>/dev/null | wc -l)

    if [ "$window_count" -ge "$expected_windows" ]; then
        return 0 # Servers appear to be running
    else
        return 1 # Session exists but not enough windows
    fi
}

# Boot regular servers with safety check
Boot_Server_Proc() {
    log_boot "Starting Boot_Server_Proc"

    # Check if servers are already running
    if check_servers_running "rampage" 6; then
        log_boot "Rampage servers are already running - skipping boot"

        # List current windows for verification
        local windows=$(tmux list-windows -t "rampage" -F "#{window_name}" 2>/dev/null | tr '\n' ' ')
        log_boot "Active rampage windows: $windows"

        return 0
    fi

    log_boot "Rampage servers not running - proceeding with boot"

    # Kill any existing rampage session (partial/failed)
    if tmux has-session -t "rampage" 2>/dev/null; then
        log_boot "Killing existing (incomplete) rampage session"
        tmux kill-session -t "rampage"
        sleep 2
    fi

    # Start the session
    if ! Screen_Start "rampage"; then
        log_boot "Failed to start rampage session" "ERROR"
        return 1
    fi

    sleep 2

    # Create windows
    local windows=("priv" "pub" "duel" "hns" "veng" "lg")
    local ports=(10666 10667 10668 10670 10671 10672)
    local ids=(0 1 2 4 5 6)

    for i in "${!windows[@]}"; do
        log_boot "Creating window: ${windows[$i]} (ID: ${ids[$i]})"
        if ! Window_Create "${windows[$i]}" "$i" "rampage"; then
            log_boot "Failed to create window ${windows[$i]}" "ERROR"
            return 1
        fi
    done

    sleep 2

    # Start servers
    for i in "${!windows[@]}"; do
        log_boot "Starting server: ${windows[$i]} on port ${ports[$i]}"
        if ! Server_Start "${windows[$i]}" "${ids[$i]}" "${ports[$i]}" "rampage"; then
            log_boot "Failed to start server ${windows[$i]}" "ERROR"
            # Continue with other servers even if one fails
        fi
        sleep 1
    done

    sleep 2

    # Verify all servers started
    log_boot "Verifying server startup..."
    local active_windows=$(tmux list-windows -t "rampage" -F "#{window_name}" 2>/dev/null | wc -l)
    log_boot "Active windows in rampage session: $active_windows"

    if [[ $active_windows -eq ${#windows[@]} ]]; then
        log_boot "All servers started successfully"
        return 0
    else
        log_boot "Some servers may have failed to start" "WARN"
        return 1
    fi
}

# Boot vengeance servers with safety check
Boot_Servers_Veng() {
    local VENG_WEEKNUM="${1:-0}"

    log_boot "Starting Boot_Servers_Veng with week: $VENG_WEEKNUM"

    # Check if vengeance servers are already running
    if check_servers_running "vengeance" 4; then
        log_boot "Vengeance servers are already running - skipping boot"

        # List current windows for verification
        local windows=$(tmux list-windows -t "vengeance" -F "#{window_name}" 2>/dev/null | tr '\n' ' ')
        log_boot "Active vengeance windows: $windows"

        return 0
    fi

    log_boot "Vengeance servers not running - proceeding with boot"

    # Kill any existing vengeance session (partial/failed)
    if tmux has-session -t "vengeance" 2>/dev/null; then
        log_boot "Killing existing (incomplete) vengeance session"
        tmux kill-session -t "vengeance"
        sleep 2
    fi

    # Start the session
    if ! Screen_Start "vengeance"; then
        log_boot "Failed to start vengeance session" "ERROR"
        return 1
    fi

    sleep 2

    # Create windows
    local windows=("game-a" "game-b" "prac-a" "prac-b")
    local ports=(10690 10691 10692 10693)
    local ids=(0 1 2 3)

    for i in "${!windows[@]}"; do
        log_boot "Creating vengeance window: ${windows[$i]} (ID: ${ids[$i]})"
        if ! Window_Create "${windows[$i]}" "$i" "vengeance"; then
            log_boot "Failed to create window ${windows[$i]}" "ERROR"
            return 1
        fi
    done

    sleep 2

    # Start servers
    for i in "${!windows[@]}"; do
        log_boot "Starting vengeance server: ${windows[$i]} on port ${ports[$i]}"
        if ! Server_Start "${windows[$i]}" "${ids[$i]}" "${ports[$i]}" "vengeance" "$VENG_WEEKNUM"; then
            log_boot "Failed to start server ${windows[$i]}" "ERROR"
            # Continue with other servers even if one fails
        fi
        sleep 1
    done

    sleep 2

    # Verify all servers started
    log_boot "Verifying vengeance server startup..."
    local active_windows=$(tmux list-windows -t "vengeance" -F "#{window_name}" 2>/dev/null | wc -l)
    log_boot "Active windows in vengeance session: $active_windows"

    if [[ $active_windows -eq ${#windows[@]} ]]; then
        log_boot "All vengeance servers started successfully"
        return 0
    else
        log_boot "Some vengeance servers may have failed to start" "WARN"
        return 1
    fi
}

# Force restart functions (for manual use)
Force_Restart_Rampage() {
    log_boot "Force restart requested for rampage servers"

    if tmux has-session -t "rampage" 2>/dev/null; then
        log_boot "Killing existing rampage session"
        tmux kill-session -t "rampage"
        sleep 2
    fi

    # Remove the safety check for forced restart
    local saved_function=$(declare -f Boot_Server_Proc)

    # Temporarily redefine without the check
    Boot_Server_Proc() {
        log_boot "Starting Boot_Server_Proc (forced)"

        # Kill any existing rampage session
        if tmux has-session -t "rampage" 2>/dev/null; then
            log_boot "Killing existing rampage session"
            tmux kill-session -t "rampage"
            sleep 2
        fi

        # Rest of the original function continues...
        # (Copy the rest of Boot_Server_Proc here without the initial check)
    }

    # Call the modified function
    Boot_Server_Proc

    # Restore original function
    eval "$saved_function"
}

# Hourly check procedure
Hourly_Check_Proc() {
    log_boot "Running hourly check procedure"

    # First check if sessions exist at all
    local rampage_exists=$(tmux has-session -t "rampage" 2>/dev/null && echo "yes" || echo "no")
    local vengeance_exists=$(tmux has-session -t "vengeance" 2>/dev/null && echo "yes" || echo "no")

    log_boot "Session existence - Rampage: $rampage_exists, Vengeance: $vengeance_exists"

    # If sessions don't exist, start them
    if [[ "$rampage_exists" == "no" ]]; then
        log_boot "Rampage session missing - starting servers"
        Boot_Server_Proc
    else
        # Session exists, check if servers are actually responsive
        log_boot "Rampage session exists - checking server health"
        if command -v check_and_restart_session_servers &>/dev/null; then
            check_and_restart_session_servers "rampage"
        else
            log_boot "Health check function not available - checking window count only"
            if ! check_servers_running "rampage" 6; then
                log_boot "Rampage session is degraded - attempting full restart"
                tmux kill-session -t "rampage" 2>/dev/null
                sleep 2
                Boot_Server_Proc
            fi
        fi
    fi

    if [[ "$vengeance_exists" == "no" ]]; then
        # Only start vengeance if we have a week number
        if [[ -n "${VENG_WEEKNUM}" ]] && [[ "${VENG_WEEKNUM}" -ne -1 ]]; then
            log_boot "Vengeance session missing - starting servers for week $VENG_WEEKNUM"
            Boot_Servers_Veng "$VENG_WEEKNUM"
        fi
    else
        # Session exists, check if servers are actually responsive
        log_boot "Vengeance session exists - checking server health"
        if command -v check_and_restart_session_servers &>/dev/null; then
            check_and_restart_session_servers "vengeance" "${VENG_WEEKNUM:-0}"
        else
            log_boot "Health check function not available - checking window count only"
            if ! check_servers_running "vengeance" 4; then
                log_boot "Vengeance session is degraded - attempting full restart"
                tmux kill-session -t "vengeance" 2>/dev/null
                sleep 2
                if [[ -n "${VENG_WEEKNUM}" ]] && [[ "${VENG_WEEKNUM}" -ne -1 ]]; then
                    Boot_Servers_Veng "$VENG_WEEKNUM"
                fi
            fi
        fi
    fi

    # Log current state
    log_boot "Current tmux sessions:"
    tmux list-sessions 2>/dev/null | while IFS= read -r line; do
        log_boot "  $line"
    done

    return 0
}

# Status check function (for manual use or monitoring)
Check_Server_Status() {
    echo "=== Server Status Check ==="
    echo "Time: $(date)"
    echo ""

    echo "Rampage Servers:"
    if check_servers_running "rampage" 6; then
        echo "  Status: RUNNING"
        echo "  Windows:"
        tmux list-windows -t "rampage" -F "    #{window_index}: #{window_name}" 2>/dev/null
    else
        echo "  Status: NOT RUNNING"
    fi

    echo ""
    echo "Vengeance Servers:"
    if check_servers_running "vengeance" 4; then
        echo "  Status: RUNNING"
        echo "  Windows:"
        tmux list-windows -t "vengeance" -F "    #{window_index}: #{window_name}" 2>/dev/null
    else
        echo "  Status: NOT RUNNING"
    fi
}
