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

# Menu_Screen_GetWindow
# {
#     SCREENLIST=($(Screen_GetList "all"))
#     echo "All Active Sessions:"
#     for i in "${!SCREENLIST[@]}"; do
#         echo "      ${SCREENLIST[$i]}"
#     done
#     if [  ]
#     echo "What Session ID?"
#     echo "Type 0 to go back to Main Menu"
#     read -p "Enter Option: " OPTION
#     case $OPTION in
#         0) Menu_Screen_Main ;;
#         *) Screen_Stop "specific" $OPTION ;;
#     esac
# }