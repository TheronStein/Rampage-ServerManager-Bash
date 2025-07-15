#!/usr/bin/bash
# source utils/defs/hostnames.sh

# server_manager.sh - Main server management functions

# Source required configuration files
# source configs.sh
# source wads.sh
# source hostnames.sh

# Function to clean multi-line strings (removes newlines and extra spaces)
clean_string() {
    echo "$1" | tr '\n' ' ' | sed 's/  */ /g' | sed 's/^ *//;s/ *$//'
}

# Updated Server_Start function for tmux
Server_Start() {
    local NAME="$1"
    local ID=$2
    local PORT=$3
    local SESSIONNAME="$4"
    local WEEKNUM=$5

    tmux send-keys -t $SESSIONNAME:$NAME "cd /home/rampage/zandronum3.2" Enter

    if [ $SESSIONNAME == "rampage" ]; then
        echo "Starting Rampage Servers: $NAME | ID: $ID"
        local hostname_string=$(build_regular_hostname $ID)
        local config_clean=$(clean_string "${configs[$ID]}")
        local wad_clean=$(clean_string "${wadlist[$ID]}")
        SERVERSTRING="./zandronum-server -port $PORT -file $wad_clean $config_clean $hostname_string"

    elif [ $SESSIONNAME == "vengeance" ]; then
        # Set VENG_WEEKNUM for use in config expansion
        export VENG_WEEKNUM=$WEEKNUM

        if [ $ID -lt 2 ]; then
            echo "Starting Vengeance Game Servers: $NAME | ID: $ID"
            local week_name="${veng_season[$VENG_WEEKNUM]}"
            local config_with_week="${veng_configs[1]/\$\{veng_season\[\$VENG_WEEKNUM\]\}/$week_name}"
            local config_clean=$(clean_string "$config_with_week")
            local wad_clean=$(clean_string "${veng_wadlist[1]}")
            local hostname_string=$(build_vengeance_hostname $WEEKNUM $ID)
            SERVERSTRING="./zandronum-server -port $PORT -file $wad_clean $config_clean $hostname_string"
        else
            echo "Starting Vengeance Practice Servers: $NAME | ID: $ID"
            local week_name="${veng_season[$VENG_WEEKNUM]}"
            local config_with_week="${veng_configs[0]/\$\{veng_season\[\$VENG_WEEKNUM\]\}/$week_name}"
            local config_clean=$(clean_string "$config_with_week")
            local wad_clean=$(clean_string "${veng_wadlist[0]}")
            local hostname_string=$(build_vengeance_hostname $WEEKNUM $ID)
            SERVERSTRING="./zandronum-server -port $PORT -file $wad_clean $config_clean $hostname_string"
        fi
    else
        echo "Starting Servers: $NAME | ID: $ID"
    fi

    echo "Starting Server $NAME | ID: $ID ..."
    echo "Server String is $SERVERSTRING"
    tmux send-keys -t $SESSIONNAME:$NAME "$SERVERSTRING" Enter
    sleep 2
    echo "..."
    sleep 2
    echo "..."
}

# # Updated Server_Start function with proper hostname generation
# Server_Start() {
#     local NAME="$1"
#     local ID=$2
#     local PORT=$3
#     local SESSIONNAME="$4"
#     local WEEKNUM=$5
#
#     screen -S ${SESSIONNAME} -p ${NAME} -X stuff "cd /home/rampage/zandronum3.2\n"
#
#     if [ ${SESSIONNAME} == "rampage" ]; then
#         echo "Starting Rampage Servers: ${NAME} | ID: ${ID}"
#         local hostname_string=$(build_regular_hostname ${ID})
#         SERVERSTRING="./zandronum-server -port ${PORT} -file ${wadlist[$ID]} ${configs[$ID]} ${hostname_string}"
#     elif [ ${SESSIONNAME} == "vengeance" ]; then
#         if [ ${ID} -lt 2 ]; then
#             echo "Starting Vengeance Game Servers: ${NAME} | ID: ${ID}"
#             local week_name="${veng_season[$VENG_WEEKNUM]}"
#
#             local config_with_week="${veng_configs[1]/\$\{veng_season\[\$VENG_WEEKNUM\]\}/$week_name}"
#             local config_clean=$(clean_string "$config_with_week")
#             local hostname_string=$(build_vengeance_hostname $WEEKNUM $ID)
#             SERVERSTRING="./zandronum-server -port ${PORT} -file ${veng_wadlist[1]} ${hostname_string} ${config_clean}"
#         else
#             echo "Starting Vengeance Practice Servers: ${NAME} | ID: ${ID}"
#             local week_name="${veng_season[$VENG_WEEKNUM]}"
#             local config_with_week="${veng_configs[0]/\$\{veng_season\[\$VENG_WEEKNUM\]\}/$week_name}"
#             local config_clean=$(clean_string "$config_with_week")
#             local hostname_string=$(build_vengeance_hostname $WEEKNUM $ID)
#             SERVERSTRING="./zandronum-server -port ${PORT} -file ${veng_wadlist[0]} ${hostname_string} ${config_clean} "
#         fi
#     else
#         echo "Starting Servers: ${NAME} | ID: ${ID}"
#     fi
#
#     echo "Starting Server ${NAME} | ID: ${ID} ..."
#     echo "Server String is ${SERVERSTRING}"
#     screen -S ${SESSIONNAME} -p ${NAME} -X stuff "${SERVERSTRING}^M"
#     sleep 2
#     echo "..."
#     sleep 2
#     echo "..."
# }

# Function to test hostname generation
test_hostnames() {
    echo "Testing Regular Server Hostnames:"
    for i in "${!servers[@]}"; do
        echo "Server $i: $(build_regular_hostname $i)"
    done

    echo -e "\nTesting Vengeance Server Hostnames:"
    for week in "${!veng_week[@]}"; do
        echo "Week $((week + 1)):"
        for server_id in {0..3}; do
            echo "  Server $server_id: $(build_vengeance_hostname $week $server_id)"
        done
    done
}
