Menu_Display_Servers()
{
    echo "=================================="
    echo "Initializing Status Menu..."
    echo "=================================="
    echo ""
    Server_Proc_Init
    # sleep 1
    # echo "Choose an option..."
    # echo "1. Shutdown Specific Server"
    # echo "2. Shutdown All Servers"
    # echo "3. Shutdown Specific Screen Session"
    # echo "4. Shutdown All Screens"
    # echo "5. Menu Option Descriptions"
    # echo "6. Back"
    # read -p "Enter Option: " OPTION
    # case $OPTION in
    #     1) Server_Stop_Specific;;
    #     2) Server_Stop_All;;
    #     3) Screen_Stop_Specific;;
    #     4) Screen_Stop_All;;
    #     5) Main_Menu;;
    #     *) echo "Invalid Option" ;;
    # esac
    return
}