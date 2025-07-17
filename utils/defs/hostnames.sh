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
    local server_letter server_type

    # ensure we have a numeric server_id
    if ! [[ "$server_id" =~ ^[0-9]+$ ]]; then
        echo "ERROR: server_id must be a number, got '$server_id'" >&2
        return 1
    fi

    # Determine server letter (A or B)
    if ((server_id % 2 == 0)); then
        server_letter="A"
    else
        server_letter="B"
    fi

    # Determine if it's Game (<2) or Practice (>=2)
    if ((server_id < 2)); then
        server_type="Game"
    else
        server_type="Practice"
    fi

    # Build and echo your hostname
    echo "${week_num}_${server_type}_${server_letter}"
}

# Get vengeance value (wrapper for backward compatibility)
# Usage: get_veng_value <week_num> <server_id>
get_veng_value() {
    local week_num=$1
    local server_id=$2
    build_vengeance_hostname $week_num $server_id
}
