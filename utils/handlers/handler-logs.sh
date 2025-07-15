#!/bin/bash

# Function to log an info message
log_info() {
    local message="$1"
    echo "[INFO] $(date '+%Y-%m-%d %H:%M:%S') - $message" >> "$LOGDIR/Status.log"
}

# Function to log a warning message
log_warning() {
    local message="$1"
    echo "[WARNING] $(date '+%Y-%m-%d %H:%M:%S') - $message" >> "$LOGDIR/Status.log"
}

# Function to log an error message
log_error() {
    local message="$1"
    echo "[ERROR] $(date '+%Y-%m-%d %H:%M:%S') - $message" >> "$LOGDIR/Status.log"
}

# Example usage
log_info "This is an info message"
log_warning "This is a warning message"
log_error "This is an error message"