Menu_Screen_Main()
{
    Write_Menu "Screen Session" "Options" "SCREEN"
    echo "1. Start New Screen Sessions"
    echo "2. Stop Screen Sessions"
    echo "3. Count Screen Sessions"
    echo "4. Display Screen Sessions"
    echo "5. Get Windwos for Screen Session"
    echo "6. Exit"
    read -p "Enter Option: " OPTION
    case $OPTION in
        1) Screen_Init_Proc "start";;
        2) Screen_Init_Proc "stop" ;;
        3) Screen_Init_Proc "count" ;;
        4) Screen_Init_Proc "get" ;;
        5) Screen_Init_Proc "getwindow" ;;
        6) exit ;;
        *) echo "Invalid Option" ;;
    esac
}

Menu_Screen_Select()
{
    REQ="$1"
    local -a SCREENLIST
    local -a ZANSCREENLIST
    SCREENLIST=($(Screen_GetList "all"))
    Write_Menu "Active Screen Sessions"
    for i in "${!SCREENLIST[@]}"; do
        echo "      ${SCREENLIST[$i]}"
    done
    echo "What Session ID?"
    echo "Type 0 to go back to Main Menu"
    read -p "Enter ID: " OPTION
    if [ $REQ = "stop" ]; then
        case $OPTION in
        0) Menu_Screen_Main ;;
        *) Screen_Stop "specific" $OPTION ;;
        esac
    
    elif [ $REQ = "getwindow" ]; then
        if [ $OPTION = 0 ]; then
            Menu_Screen_Main
    else
        for i in "${!SCREENLIST[@]}"; do
            if [ $OPTION = ${SCREENLIST[$i]} ]; then
                local -a WINLIST
                WINLIST=($(Window_GetList "$OPTION"))
                sleep 1
                for i in "${!WINLIST[@]}"; do
                    echo "$i is ${WINLIST[$i]}"
                done
                sleep 3
                echo "Returning to main menu..."
                Menu_Screen_Main
            fi
        done
        echo "Invalid Option... Returning to Main Menu..."
        fi
    fi
}

Menu_Screen_Stop()
{   
    Write_Menu "Screen Shutdown" "Menu" "SCREEN"
    echo "1. Stop All Screens"
    echo "2. Stop Rampage Screens"
    echo "3. Stop Specific Screen"
    echo "4. Back to Main Menu"
    read -p "Enter Option: " OPTION
    case $OPTION in
        1) Screen_Stop_Proc "all" 0 ;;
        2) Screen_Stop_Proc "rampage" 0 ;;
        3) Screen_Stop_Proc "specific" 0 ;;
        4) Menu_Screen_Main ;;
        *) echo "Invalid Option" ;;
    esac
}