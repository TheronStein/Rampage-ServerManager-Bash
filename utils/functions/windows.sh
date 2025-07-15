CONSDIR="$SRCDIR/temp"

# HANDLER FUNCTIONS: Window_Create
# GET FUNCTIONS: Window_GetNames, Window_GetCount
# SET FUNCTIONS: Window_List_MapToSessionID
# CHECK FUNCTIONS: Window_IsServer_Check, Window_IsActive_Check
# MISC FUNCTIONS: Window_Write_PlayerInfo

#MENU FUNCTIONS - Menu_Window_Main, Menu_Window_Getlist


Window_Create()
{
    WINDOWNAME="$1"
    ID=$2
    SESSIONNAME="$3"

    if [ $ID -eq 0 ]; then
        echo "Creating first window for $WINDOWNAME in $SESSIONNAME..."
        screen -S $SESSIONNAME -p $ID -X title $WINDOWNAME
    else
        echo "Creating window for $WINDOWNAME $SESSIONNAME..."
        screen -S $SESSIONNAME -X screen -t $WINDOWNAME #2
    fi
}

Window_Delete()
{
    WINDOWNAME="$1"
    SESSIONNAME="$2"
    echo "Deleting window $WINDOWNAME for $SESSIONNAME..."
    screen -S $SESSIONNAME -p $WINDOWNAME -X quit
}

Window_Write()
{
    NAME="$1"
    SESSIONNAME="$2"
    COMMAND="$3"
    COMMANDSTRING="$4"
    echo "Executing $COMMANDSTRING"
    screen -S $SESSIONNAME -p $NAME -X stuff "$COMMAND^M"
}

Window_GetCount()
{
    SESSIONNAME="$1"
    local -i WINCOUNT=$(screen -S $SESSIONNAME -Q windows | tr ' ' '\n' | grep -E '^[0-9]+$' | sort -n | tail -n1)
    echo $WINCOUNT
}

Window_GetName()
{
    SESSIONNAME="$1"
    POSITION=$2
    local NAME=$(screen -S $SESSIONNAME -Q windows | awk -v pos="$POSITION" '{print $pos; exit}')
    # local NAME=$(screen -S $SESSIONNAME -Q windows | awk '{print int ($POSITION); print substr($0, index($0,$2))}')
    echo $NAME
}

Window_SetList()
{
    ID="$1"
    # ID2=$2
    declare -i FOUND
    FOUND=0
    local -a SCREENLIST
    SCREENLIST=($(Screen_GetList "all"))
    for i in "${!SCREENLIST[@]}"; do
        sleep 2
        if [ $ID = ${SCREENLIST[$i]} ]; then
            FOUND=1
            # echo "=================================="
            # echo "STRING MATCH!!!!!"
            # echo "=================================="
            local -a WINDALIST
            local -i WINCOUNT
            WINDOW_INFO["$ID,WINDOWCOUNT"]=$(Window_GetCount "$ID")
            # WINDALIST=($(Window_GetList "$ID"))
            declare -i countindex
            countindex=0
            for ((i=0; i<=WINDOW_INFO["$ID,WINDOWCOUNT"]; i++)); do
                countindex=$(($countindex+2))
                WINDOW_INFO["$ID,$i,WINDOWNAME"]=$(Window_GetName "$ID" $countindex)
            done
                # Testing for Name Values
                # for key in "${!WINDOW_INFO[@]}"; do
                #     echo "Key: $key"
                #     echo "Value: ${WINDOW_INFO[$key]}"
                # done
            Return_Main_Menu
        fi

    done
    if [ $FOUND -eq 0 ]; then
        echo "Invalid Session ID, Please try again..."
        Return_Window_Menu
    fi
    Error_Handler "Window_Getlist_Init_Proc" "Window" $FOUND
}


# Window_Check()
# {
#     NAME="$1"
#     SESSIONNAME="$2"

# }

# Window_Write_PlayerInfo()
# {
#     NAME="$1"
#     SESSIONNAME="$2"
#     screen -S $SESSIONNAME -p $NAME -X stuff "clear^M"
#     echo "clearing console..."
#     sleep 1
#     screen -S $SESSIONNAME -p $NAME -X stuff "playerinfo^M"
#     echo "writing playerinfo to console..."
#     sleep 1
#     echo "outputting to a file..."
#     Window_Hardcopy_Handler "write" "$NAME" "$SESSIONNAME" ""
# }