#!/bin/bash

# HANDLER FUNCTIONS: Screen_Start, Screen_Stop
# GET FUNCTIONS: Screen_Count, Screen_GetList
# CHECK FUNCTIONS: N/A
# MISC FUNCTIONS: N/A

Screen_Start()
{
    NAME="$1"
    # Log file path
    log_file="/home/rampage/server_start.log"
    echo "Starting $NAME Screen Session..."
    screen -dmS $NAME
    sleep 1
    Write_Menu "Server Start Initiated..." "" ""
}

Screen_Stop()
{
    REQ=$1
    ID=$2
    local -a SCRNLIST
    if [ $REQ = "rampage" ]; then
        SCRNLIST=($(Screen_GetList "rampage"))
        echo "Terminating all rampage screen sessions..."
        for i in "${!SCRNLIST[@]}"; do
            echo "Terminating ${SCRNLIST[$i]}..."
            screen -S ${SCRNLIST[i]} -X quit
            sleep 1
            #SUCCESS=$($(Get_Session_Status $SCREENLIST[$i]))
        done
        #return $SUCCESS
    elif [ $REQ = "all" ]; then
        SCRNLIST=($(Screen_GetList "all"))
        echo "Terminating all screen sessions..."
        for i in "${!SCRNLIST[@]}"; do
            echo "Terminating ${SCRNLIST[$i]}..."
            screen -S ${SCRNLIST[i]} -X quit
            sleep 1
            #SUCCESS=$($(Get_Session_Status $SCREENLIST[$i]))
        done
        #SUCCESS=$($(Get_Session_Status $SCREENLIST[$i]))
        #return $SUCCESS
    elif [ $REQ = "specific" ]; then
        if [ -z $ID ]; then
            echo "No session ID provided"
            return
        else
            echo "Terminating screen session $ID..."
            screen -S $ID -X quit
            #SUCCESS=$($(Get_Session_Status $ID))
            #return $SUCCESS
        fi
    fi

    Write_Menu "Server Stop Process Completed..." "" ""
}

Screen_Count()
{
    TYPE="$1"
        declare -i SCREENNUM
        if [ $TYPE = "all" ]; then
            SCREENNUM=$(screen -ls | wc -l)
            SCREENNUM=$((SCREENNUM-2))
        fi
        if [ $TYPE = "rampage" ]; then
            SCREENNUM=$(screen -ls | grep "rampage" | wc -l)
            SCREENNUM+=$(screen -ls | grep "Rampage" | wc -l)
            SCREENNUM+=$(screen -ls | grep "RAMPAGE" | wc -l)
        fi
    echo $SCREENNUM
}

Screen_GetList()
{
    TYPE="$1"
    declare -a screen_array

    if [ $TYPE = "all" ]; then
        while IFS= read -r line; do
            screen_array+=("$line")
        done < <(screen -ls | cut -d "." -f1)  # awk '{print $1}'
    fi

    if [ $TYPE = "rampage" ]; then
        while IFS= read -r line; do
            screen_array+=("$line")
        done < <(screen -ls | grep "rampage" | cut -d "." -f1)  # awk '{print $1}'
        while IFS= read -r line; do
            screen_array+=("$line")
        done < <(screen -ls | grep "Rampage" | cut -d "." -f1)  # awk '{print $1}'
        while IFS= read -r line; do
            screen_array+=("$line")
        done < <(screen -ls | grep "RAMPAGE" | cut -d "." -f1)  # awk '{print $1}'
    fi

    for i in "${!screen_array[@]}"; do
        if [[ "${screen_array[$i]}" == *"Socket"* ]]; then
            unset 'screen_array[i]'
        elif [[ "${screen_array[$i]}" == *"There are"* ]]; then
            unset 'screen_array[i]'
        elif [[ "${screen_array[$i]}" == *"There is"* ]]; then
            unset 'screen_array[i]'
        fi
    done

    #re-index to remove empty elements
    screen_array=("${screen_array[@]}")
    printf '%s\n' "${screen_array[@]}"
}

# Function to create a screen session with windows

# declare -a SCREENLIST

# Screen_Set_Info()
# {
#     SCREENLIST_ALL["SCREENS"]=($(Screen_Count "all"))
#     SCREENLIST_ALL["$ID"]=($(Screen_GetList "all"))
#     SCREENLIST_ALL["SERVERS"]+=($(Screen_Check_Window "all"))
#     SCREENLIST_ZANDRONUM["SCREENS"]=$($(Screen_Count "zandronum"))
#     SCREENLIST_ZANDRONUM["$ID"]=($(Screen_GetList "zandronum"))
#     SCREENLIST_ZANDRONUM["SERVERS"]+=($(Screen_Check_Window "zandronum"))
# }