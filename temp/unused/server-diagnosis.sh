offline_diagnosis()
{
    NAME="$1"
    ID="$2"
    STATUS="$3"
    PORT="$4"
    
    SCREENTEST=0
    SERVERTEST=0

    echo "=========================================="
    echo "Performing diagnosis on $NAME Server..."
    echo "=========================================="
    echo ""

    sleep 1

    SCREENTEST=($($check_screen_exists))

    if [ SCREENTEST -eq 0 ]
    then
        echo "Screen session doesn't exist..."
        echo "Attempting to create session..."
        echo ""
        sleep 1
        create_screen_session
    else
        echo "Screen session exists..."
        echo ""
        sleep 1
        echo "Checking to see if multiple sessions exists..."
        echo ""
        sleep 1
        check_screen_mutliple

        echo "Checking $NAME Server..."
        SERVERTEST=($($(check_server_started "$NAME" $ID)))
        if [ SERVERTEST -eq "Online" ]; then
            echo "Server $NAME is Online"
            echo "Attempts: $STARTATTEMPTS"
            STARTATTEMPTS=0
            echo " (Resetting Attempts) : $STARTATTEMPTS"
            return "Online"
        else
            echo "Server $NAME is Offline"
            echo "Attempts: $STARTATTEMPTS"
            STARTATTEMPTS=$((STARTATTEMPTS+1))
            echo "Attempts: $STARTATTEMPTS"
            return "Offline"
        fi
    fi

    #Hard copy doesn't exist?
    if [ ! -e "$HOME/zandronum_hardcopy_$NAME" ]; then
        failed_to_fix "The window reference doesn't exist..."
    
    #there's nothing inside the hardcopy file???
    elif [ ! -s "$HOME/zandronum_hardcopy_$NAME" ]; then
        echo "The window reference exists but is empty..."
        failed_to_fix "The window reference doesn't exist..."
    else
        #server is actually online????
        grep '"sv_broadcast" is "false"' "$HOME/zandronum_hardcopy_$NAME" > /dev/null 2>&1; FOUND=$?
        if [ "$FOUND" -eq 0 ]; then
            failed_to_fix "The window is in the server, it's online"
        fi

        grep '"not found"' "$HOME/zandronum_hardcopy_$NAME" > /dev/null 2>&1; FOUND=$?
        if [ "$FOUND" -eq 0 ]; then
            echo "The window is in the shell...checking directory"
            current_directory=$(pwd)
            if [ "$current_directory" -eq "/home/zandronum/zan32" ]; then
                
                server_fixed "$NAME" "$ID" "The window exists and is in the directory, just needs to be started..."
            else
                echo "The window is in the shell and the directory is incorrect"
                echo ""
                echo "Changing directory to the correct location..."
                cd /home/zandronum/zan32
                sleep 1
                echo "Checking directory..."
                current_directory=$(pwd)
                if [ "$current_directory" -eq "/home/zandronum/zan32" ]; then
                    echo "The directory is now correct"
                    start_server "$NAME" "$ID" #"$PORT"
                else
                failed_to_fix "$NAME" "$ID" "The window is in the shell and the directory is incorrect"
                fi
            fi
        fi
    fi
}

Status_Check_Server(){
    NAME="$1"
    ID="$2"
    STATUS="$3"
    if [ "$STATUS" -eq "null" ]; then
        echo "Server has not been started yet..."
        return "null"
    elif [ "$STATUS" -eq "Online" ]; then
        echo "Server $NAME | ID: $ID is Online"
        sleep 1
        return "Online"
    elif [ "$STATUS" -eq "Failed" ]; then
        echo "Server $NAME | ID: $ID is Offline and Failed to start"
        sleep 1
        return "Failed"
    elif [ "$SERV_INFO["$NAME,STATUS"]" -eq "Offline" ]; then
        echo "Server $NAME | ID: $ID is Offline"
        sleep 1
        return "Offline"
    fi
    echo "no condition met for, error"
    return "error"
}