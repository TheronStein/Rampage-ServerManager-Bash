Server_Start() {
    NAME="$1"
    ID=$2
    PORT=$3
    SESSIONNAME="$4"
    screen -S $SESSIONNAME -p $NAME -X stuff "cd /home/rampage/zandronum3.2\n"
    SERVERSTRING="./zandronum-server -port $PORT -file ${wadlist[$ID]} ${configs[$ID]} ${hostnames[$ID]}"
    echo "Starting Server $NAME | ID: $ID ..."
    echo "Server String is $SERVERSTRING^M"
    screen -S $SESSIONNAME -p $NAME -X stuff "$SERVERSTRING^M"
    sleep 2
    echo "..."
    sleep 2
    echo "..."
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
