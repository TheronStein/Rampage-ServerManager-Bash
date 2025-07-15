Main_Menu()
{
    Write_Menu "{MENU_NAMES["MAIN,STRING"]}"
    echo "Choose an option..."
    echo "1. Start Servers"
    echo "2. Shutdown Servers"
    echo "3. Restart Servers"
    echo "4. Check and Fix Servers"
    echo "5. Server Status"
    echo "6. Screen Sessions"
    echo "7. Window Options"
    echo "8. Exit"
    read -p "Enter Option: " OPTION
    case $OPTION in
        1) Server_Init_Proc "start";;
        2) Server_Init_Proc "stop" ;;
        3) Server_Init_Proc "restart" ;;
        4) Server_Init_Proc "check" ;;
        5) Server_Init_Proc "status" ;;
        6) Menu_Screen_Main ;;
        7) Menu_Window_Main ;;
        8) exit;;
        *) echo "Invalid Option" ;;
    esac
}

