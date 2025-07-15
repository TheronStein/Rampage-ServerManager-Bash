#!/bin/bash
BASE_HOSTNAME=":: [NY] = [RAMPAGE] ="
hostname='+sv_hostname ${BASE_HOSTNAME}'

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

veng_string='[VENGEANCE VI]'

# Vengeance tournament configuration
veng_season=(
    'week1'
    'week2'
    'week3'
    'week4'
    'semi'
    'finals'
)

veng_string='[VENGEANCE VI]'

veng_week=(
    ' - Week 1 - MAP52 | MAP80 '
    ' - Week 2 - MAP93 | MAP10 '
    ' - Week 3 - MAP72 | MAP35 '
    ' - Week 4 - MAP79 | MAP68 '
    ' - Semi Finals - XXX vs XXX'
    ' - Finals - XXX vs XXX'
)

# hostnames2=(
#     '+sv_hostname ":: [NY] = [DOOMRAMPAGE.ORG] = [Priv CTF] ::"'
#     '+sv_hostname ":: [NY] = [DOOMRAMPAGE.ORG] = [Public CTF] ::"'
#     '+sv_hostname ":: [NY] = [DOOMRAMPAGE.ORG] =  [Duel40] ::"'
#     '+sv_hostname ":: [NY] = [DOOMRAMPAGE.ORG] = [Rivals Duel] ::"'
#     '+sv_hostname ":: [NY] = [DOOMRAMPAGE.ORG] = [Hide n Seek] ::"'
# )

# Build regular server hostname
# Usage: build_regular_hostname <server_id>
build_regular_hostname() {
    local server_id=$1
    echo '${hostname} ${servers[$server_id]} ::\"'
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
    echo '${hostname} ${veng_string}${veng_week[$week_num]} :: ${server_type} ${server_letter} :: \"'
}

# Get vengeance value (wrapper for backward compatibility)
# Usage: get_veng_value <week_num> <server_id>
get_veng_value() {
    local week_num=$1
    local server_id=$2
    build_vengeance_hostname $week_num $server_id
}
