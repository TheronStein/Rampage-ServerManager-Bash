# source utils/defs/hostnames.sh

# Updated Server_Start function with proper hostname generation
Server_Start() {
    local NAME="$1"
    local ID=$2
    local PORT=$3
    local SESSIONNAME="$4"
    local WEEKNUM=$5

    screen -S $SESSIONNAME -p $NAME -X stuff "cd /home/rampage/zandronum3.2\n"

    if [ $SESSIONNAME == "rampage" ]; then
        echo "Starting Rampage Servers: $NAME | ID: $ID"
        local hostname_string=$(build_regular_hostname $ID)
        SERVERSTRING="./zandronum-server -port $PORT -file ${wadlist[$ID]} ${configs[$ID]} $hostname_string"

    elif [ $SESSIONNAME == "vengeance" ]; then
        if [ $ID -lt 2 ]; then
            echo "Starting Vengeance Game Servers: $NAME | ID: $ID"
            local hostname_string=$(build_vengeance_hostname $WEEKNUM $ID)
            SERVERSTRING="./zandronum-server -port $PORT -file ${veng_wadlist[1]} ${veng_configs[1]} $hostname_string"
        else
            echo "Starting Vengeance Practice Servers: $NAME | ID: $ID"
            local hostname_string=$(build_vengeance_hostname $WEEKNUM $ID)
            SERVERSTRING="./zandronum-server -port $PORT -file ${veng_wadlist[0]} ${veng_configs[0]} $hostname_string"
        fi
    else
        echo "Starting Servers: $NAME | ID: $ID"
    fi

    echo "Starting Server $NAME | ID: $ID ..."
    echo "Server String is $SERVERSTRING"
    screen -S $SESSIONNAME -p $NAME -X stuff "$SERVERSTRING^M"
    sleep 2
    echo "..."
    sleep 2
    echo "..."
}

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

# Function to execute the zandronum command in the specified window

#servers sometimes take a minute to start up
#$SERV_INFO["$NAME,STATUS"]=$($(check_server_status SERV_INFO["$NAME,Name"] $NUM))
# if [ "$STATUS" -eq "Online" ]; then
#     echo "Server $NAME | ID: $ID is already Online"
#     return "Online"
# fi

# if [$SERV_INFO["$NAME,STATUS"] -eq "Online"]; then
#     echo "Server $NAME | ID: $ID is already Online"
#     return "Online"
# fi
#servers sometimes take a minute to start up
# $SERV_INFO["$NAME,STATUS"]=$($(check_server_status SERV_INFO["$NAME,Name"] $ID))
# return $SERV_INFO["$NAME,STATUS"]

#start server if returns fail then try to run fix functions
# echo "Status of server is: $SERV_INFO['$name,STATUS']"
# $SERV_INFO["$name,STATUS"]=$($start_server("$name" ${id} "$SERV_INFO["$name,STATUS"]" "$SERV_INFO["$name,PORT"]"))
# sleep 1
# echo ""
# Kill existing zandronum sessions and log the actions
#Screen -ls | awk '/\.zandronum/ {print $1}' | xargs -I {} screen -X -S {} quit >> "$log_file" 2>&1

# Create a new detached screen session named "zandronum" and log the action

#priv - 0

# # Define the commands to be executed in each screen window
