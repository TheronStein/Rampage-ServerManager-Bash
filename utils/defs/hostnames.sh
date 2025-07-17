#!/bin/bash
# hostnames.sh - Configuration and functions for building server hostname strings

BASE_HOSTNAME=":: [NY] = [RAMPAGE] ="

# Regular server types
servers=(
    '[Priv CTF]'
    '[Public CTF]'
    '[Duel40]'
    '[Rivals Duel]'
    '[Hide n Seek]'
    '[Vengeance Priv]'
    '[LG Duel]'
)

# Vengeance tournament configuration
veng_season=(
    'week1'
    'week2'
    'week3'
    'week4'
    'semis'
    'finals'
)

veng_string='[VENGEANCE VI]'

veng_week=(
    ' - Week 1 - MAP52 + MAP80 '
    ' - Week 2 - MAP93 + MAP10 '
    ' - Week 3 - MAP72 + MAP35 '
    ' - Week 4 - MAP79 + MAP68 '
    ' - Semi Finals - XXX vs XXX '
    ' - Finals - XXX vs XXX '
)

# Build regular server hostname
# Usage: build_regular_hostname <server_id>
build_regular_hostname() {
    local server_id=$1
    printf "+sv_hostname \"%s %s ::\"" "${BASE_HOSTNAME}" "${servers[$server_id]}"
}

# Build vengeance hostname
# Usage: build_vengeance_hostname <week_num> <server_id>
build_vengeance_hostname() {
    local week_num=$1
    local server_id=$2
    local server_letter

    # Determine server letter (A or B)
    if [ $((server_id % 2)) -eq 0 ]; then
        server_letter="A"
    else
        server_letter="B"
    fi

    # Determine if it's Practice or Game server
    local server_type
    if [ $server_id -lt 2 ]; then
        server_type="Game"
    else
        server_type="Practice"
    fi

    # Build the complete hostname
    printf "+sv_hostname \"%s %s%s:: %s %s ::\"" "${BASE_HOSTNAME}" "${veng_string}" "${veng_week[$week_num]}" "${server_type}" "${server_letter}"
}

# Get vengeance value (wrapper for backward compatibility)
# Usage: get_veng_value <week_num> <server_id>
get_veng_value() {
    local week_num=$1
    local server_id=$2
    build_vengeance_hostname $week_num $server_id
}
