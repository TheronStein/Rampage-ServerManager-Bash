Server_Init_Proc()
{
    source $HANDIR/servers/*
    PROC="$1"
    if [ "$PROC" = "start" ]; then
        
        ${MENU_NAMES["SERVSTART,FUNC"]}
    elif [ "$PROC" = "stop" ]; then
        ${MENU_NAMES["SERVSHUTDOWN,FUNC"]}
    elif [ "$PROC" = "restart" ]; then
        ${MENU_NAMES["SERVRESET,FUNC"]}
    elif [ "$PROC" = "check" ]; then
        ${MENU_NAMES["SERVCHECK,FUNC"]}
    elif [ "$PROC" = "status" ]; then
        ${MENU_NAMES["SERVSTATUS,FUNC"]}
    fi
    Error_Handler "Out of Bounds" "Server_Init_Proc" "${MENU_NAMES["MAIN,FUNCTION"]}" "${MENU_NAMES["MAIN,STRING"]}" "$PROC"
}

Window_Init_Proc()
{
    PROC="$1"
    if [ $PROC = "get" ]; then
        Menu_Window_Getlist "get"
        sleep 2
    else
        echo "Invalid Option..."
        Return_Main_Menu
        sleep 2
    fi
    Error_Window_Proc $PROC
}

Screen_Init_Proc()
{
    PROC="$1"
    echo "=================================="
    echo "Processing $PROC for Screens..."
    echo "=================================="
    echo ""
    if [ $PROC = "start" ]; then
        ZANSCREENCOUNT=$(Screen_Count "rampage")
        if [ $ZANSCREENCOUNT -gt 0 ]; then
            echo "Rampage Screens are already running"
            sleep 1
            echo "Returning to Main Menu..."
            sleep 1
            echo "..."
            Menu_Screen_Main
        fi
        echo "Starting Screen..."
        Screen_Start
        sleep 1
    elif [ $PROC = "stop" ]; then
        Menu_Screen_Stop
    elif [ $PROC = "count" ]; then
        local -i SCREENCOUNT
        local -i ZANSCREENCOUNT
        SCREENCOUNT=$(Screen_Count "all")
        echo "Total Screens: $SCREENCOUNT"
        ZANSCREENCOUNT=$(Screen_Count "rampage")
        echo "Total Rampage Zan Screens: $ZANSCREENCOUNT"
        sleep 3
    elif [ $PROC = "get" ]; then
        local -a SCREENLIST
        local -a ZANSCREENLIST
        SCREENLIST=($(Screen_GetList "all"))
        ZANSCREENLIST=($(Screen_GetList "rampage"))
        echo "All Screen Sessions:"
        for i in "${!SCREENLIST[@]}"; do
            echo "${SCREENLIST[$i]}"
        done
        echo "Rampage Zan Screen Sessions:"
        for i in "${!ZANSCREENLIST[@]}"; do
            echo "$i is ${ZANSCREENLIST[$i]}"
        done
        #SCREENCOUNT=${#SCREENLIST[@]}
        #ZANSCREENCOUNT=${#ZANSCREENLIST[@]}
        read -p "Press any key to continue..." OPTION
        case $OPTION in
        *) Menu_Screen_Main ;;
        esac
    elif [ $PROC = "getwindow" ]; then
        Menu_Screen_Select "getwindow"
    fi
    echo "Returning to Main Menu..."
    sleep 1
    echo "..."
    Menu_Screen_Main
}