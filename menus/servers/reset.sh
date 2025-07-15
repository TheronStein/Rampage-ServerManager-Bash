Menu_Reset_Servers()
{
    echo "=================================="
    echo "Restart Menu"
    echo "=================================="
    echo "Choose an option..."
    echo "1. Restart Everything"
    echo "2. Restart Specific Server"
    echo "3. Back"
    read -p "Enter Option: " OPTION
    case $OPTION in
        1) Server_RestartAll_Proc ;;
        2) Server_RestartSpecific_Proc ;;
        3) Main_Menu ;;
        *) echo "Invalid Option" ;;
    esac
}
