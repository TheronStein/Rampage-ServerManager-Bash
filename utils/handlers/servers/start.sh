Server_Start_Proc()
{
    REQ="$1"
    echo "=================================="
    echo "Initializing Server Start Process..."
    echo "=================================="
    echo ""
    sleep 1
    if [ $REQ = "all" ]; then
        echo "Starting all servers..."
        echo ""
        sleep 1
        for key in "${!SERV_INFO[@]}"; do
            IFS=',' read -r name field <<< "$key"
            if [[ $field == "ID" ]]; then
                id="${SERV_INFO[$key]}"
                port="${SERV_INFO[$name,PORT]}"
                echo "Starting $name | ID: ${id} | PORT: ${port}"
                echo ""
                sleep 1
                Server_Start "$name" $id $port "rampage"
            fi
        done
    elif [ $REQ = "specific" ]; then
        Menu_Start_Server_Specific
    elif [ $REQ = "new" ]; then
        echo "Not implemented yet... Returning to Main Menu"
        Main_Menu
    fi
    echo "Invalid Option... Returning to Main Menu..."
    sleep 1
    Main_Menu
}
