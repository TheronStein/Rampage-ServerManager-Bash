#!/bin/bash
# server-health-check.sh - Functions to check if Zandronum servers are actually running

# Log function for health checks
log_health() {
    local message="$1"
    local level="${2:-INFO}"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [HEALTH] [$level] $message" >>"$BOOT_LOG"
}

# Check if a specific server is responding to commands
check_server_responsive() {
    local session_name="$1"
    local window_name="$2"
    local test_command="sv_hostname"
    local expected_response="sv_hostname"
    local temp_file="/tmp/tmux_${session_name}_${window_name}_$$.txt"

    log_health "Checking if $session_name:$window_name is responsive"

    # Check if session and window exist
    if ! tmux has-session -t "$session_name" 2>/dev/null; then
        log_health "Session $session_name does not exist" "ERROR"
        return 1
    fi

    if ! tmux list-windows -t "$session_name" -F "#{window_name}" | grep -q "^${window_name}$"; then
        log_health "Window $window_name does not exist in session $session_name" "ERROR"
        return 1
    fi

    # Clear any previous output and send test command
    tmux send-keys -t "$session_name:$window_name" C-c Enter 2>/dev/null
    sleep 0.5

    # Capture current pane content to temp file
    tmux capture-pane -t "$session_name:$window_name" -p >"$temp_file" 2>/dev/null

    # Send the test command
    tmux send-keys -t "$session_name:$window_name" "$test_command" Enter
    sleep 1

    # Capture pane content again
    tmux capture-pane -t "$session_name:$window_name" -p >"${temp_file}.after" 2>/dev/null

    # Check if we got a response
    if grep -q "$expected_response" "${temp_file}.after"; then
        # Extract the hostname for logging
        local hostname=$(grep "$expected_response" "${temp_file}.after" | tail -1)
        log_health "Server $window_name is responsive: $hostname"
        rm -f "$temp_file" "${temp_file}.after"
        return 0
    else
        log_health "Server $window_name is NOT responsive" "WARN"
        rm -f "$temp_file" "${temp_file}.after"
        return 1
    fi
}

# Restart a specific server in a window
restart_server_in_window() {
    local session_name="$1"
    local window_name="$2"
    local window_id="$3"
    local server_id="$4"
    local port="$5"
    local weeknum="${6:-0}"

    log_health "Attempting to restart server in $session_name:$window_name"

    # First, try to kill any existing process
    tmux send-keys -t "$session_name:$window_name" C-c Enter 2>/dev/null
    sleep 1

    # Clear the window
    tmux send-keys -t "$session_name:$window_name" "clear" Enter
    sleep 0.5

    # Restart the server
    if [ "$session_name" == "rampage" ]; then
        Server_Start "$window_name" "$server_id" "$port" "$session_name"
    elif [ "$session_name" == "vengeance" ]; then
        Server_Start "$window_name" "$server_id" "$port" "$session_name" "$weeknum"
    fi

    # Wait a bit for server to start
    sleep 3

    # Verify it started
    if check_server_responsive "$session_name" "$window_name"; then
        log_health "Successfully restarted server in $window_name" "INFO"
        return 0
    else
        log_health "Failed to restart server in $window_name" "ERROR"
        return 1
    fi
}

# Check all servers in a session and restart dead ones
check_and_restart_session_servers() {
    local session_name="$1"
    local weeknum="${2:-0}"
    local restart_count=0

    log_health "Starting health check for session: $session_name"

    # Define server configurations based on session
    if [ "$session_name" == "rampage" ]; then
        local windows=("priv" "pub" "duel" "hns" "veng" "lg")
        local ports=(10666 10667 10668 10670 10671 10672)
        local ids=(0 1 2 4 5 6)
    elif [ "$session_name" == "vengeance" ]; then
        local windows=("game-a" "game-b" "prac-a" "prac-b")
        local ports=(10690 10691 10692 10693)
        local ids=(0 1 2 3)
    else
        log_health "Unknown session type: $session_name" "ERROR"
        return 1
    fi

    # Check each server
    for i in "${!windows[@]}"; do
        local window_name="${windows[$i]}"

        if ! check_server_responsive "$session_name" "$window_name"; then
            log_health "Server $window_name needs restart" "WARN"

            if restart_server_in_window "$session_name" "$window_name" "$i" "${ids[$i]}" "${ports[$i]}" "$weeknum"; then
                ((restart_count++))
            fi
        fi
    done

    log_health "Health check complete. Restarted $restart_count servers in $session_name"
    return 0
}

# Enhanced hourly check that verifies servers are actually running
Enhanced_Hourly_Check() {
    log_health "Starting enhanced hourly health check"

    # Check rampage servers
    if tmux has-session -t "rampage" 2>/dev/null; then
        log_health "Checking rampage session servers"
        check_and_restart_session_servers "rampage"
    else
        log_health "Rampage session not found - skipping health check"
    fi

    # Check vengeance servers
    if tmux has-session -t "vengeance" 2>/dev/null; then
        log_health "Checking vengeance session servers"
        # Get current week number from somewhere - you might want to store this
        local current_week=0 # Default to week 0
        check_and_restart_session_servers "vengeance" "$current_week"
    else
        log_health "Vengeance session not found - skipping health check"
    fi

    log_health "Enhanced hourly health check complete"
}

# Quick status check showing which servers are actually responsive
show_server_health_status() {
    echo "=== Server Health Status ==="
    echo "Time: $(date)"
    echo ""

    # Check rampage servers
    if tmux has-session -t "rampage" 2>/dev/null; then
        echo "Rampage Servers:"
        local windows=("priv" "pub" "duel" "hns" "veng" "lg")
        for window in "${windows[@]}"; do
            if check_server_responsive "rampage" "$window" &>/dev/null; then
                echo "  [$window] ✓ Running"
            else
                echo "  [$window] ✗ Not responding"
            fi
        done
    else
        echo "Rampage session not running"
    fi

    echo ""

    # Check vengeance servers
    if tmux has-session -t "vengeance" 2>/dev/null; then
        echo "Vengeance Servers:"
        local windows=("game-a" "game-b" "prac-a" "prac-b")
        for window in "${windows[@]}"; do
            if check_server_responsive "vengeance" "$window" &>/dev/null; then
                echo "  [$window] ✓ Running"
            else
                echo "  [$window] ✗ Not responding"
            fi
        done
    else
        echo "Vengeance session not running"
    fi
}

# Monitor mode - continuously check servers
monitor_servers() {
    local interval="${1:-60}" # Default 60 seconds

    echo "Starting server monitor (checking every $interval seconds)"
    echo "Press Ctrl+C to stop"

    while true; do
        clear
        show_server_health_status
        echo ""
        echo "Next check in $interval seconds..."
        sleep "$interval"
    done
}
