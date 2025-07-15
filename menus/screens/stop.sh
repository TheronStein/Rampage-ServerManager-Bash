Menu_Screen_Stop()
{
    $REQ="$1"
    if [ "$REQ" = "main" ]; then
        echo "1. Stop All Screens"
        echo "2. Stop Zandronum Screens"
        echo "3. Stop Specific Screen"
        echo "4. Back to Main Menu"
        read -p "Enter Option: " OPTION
        case $OPTION in
            1) Screen_Stop_Proc "all" ;;
            2) Screen_Stop_Proc "zandronum" ;;
            3) Screen_Stop_Proc "specific" ;;
            4) Menu_Screen_Main ;;
            *) echo "Invalid Option" ;;
        esac
    elif [ "$REQ" = "specific" ]; then
        Menu_Screen_Select "stop"
    fi
}

# Menu_Stop_Screenid()
# {
#     SCREENLIST=($(Screen_GetList "all"))
#     echo "All Active Sessions:"
#     for i in "${!SCREENLIST[@]}"; do
#         echo "      ${SCREENLIST[$i]}"
#     done
#     echo "What Session ID?"
#     echo "Type 0 to go back to Main Menu"
#     read -p "Enter Option: " OPTION
#     case $OPTION in
#         0) Menu_Screen_Main ;;
#         *) Screen_Stop "specific" $OPTION ;;
#     esac
# }