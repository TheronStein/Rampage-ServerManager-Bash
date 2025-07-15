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
    echo "Starting Server $NAME | ID: $ID ..."
    echo "Server String is $SERVERSTRING" # Define the commands to be executed in each screen window
    screen -S $SESSIONNAME -p $NAME -X stuff "$SERVERSTRING^M"
    sleep 2
    echo "..."
    sleep 2
    echo "..."
}
