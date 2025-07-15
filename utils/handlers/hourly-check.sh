
# Auto_Check_Proc()
# {

# }

Hourly_Check_Proc()
{
    
}

Auto_Check_Screens_Proc()
{
    echo "Checking Screen Sessions..."
    SCREENCOUNT=($(Screen_Count "rampage"))
    echo "Screen Count: $SCREENCOUNT"
    if [ $SCREENCOUNT -gt 1 ]; then
        echo "Multiple sessions detected... clearing all sessions and starting over"
        SCREENLIST=($(Screen_GetList))
        for i in "${!SCREENLIST[@]}"; do
            echo "Terminating ${SCREENLIST[$i]}..."
            screen -S ${SCREENLIST[i]} -X quit
            sleep 1
        done
        Auto_Start_Servers
        return
    elif [ $SCREENCOUNT -eq 0 ]; then
        echo "No sessions detected... starting all servers"
        Auto_Start_Servers
        return
    fi
}

Auto_Check_Servers_Proc()
{
    local -i SCREENCOUNT
    local -a SCREENLIST
    local -i WINDOWCOUNT
    local -a WINDOWLIST
    local -i ISSERVER
    local -i ISACTIVE
    echo "Performing Checks..."
    Main_Menu
    # WINDOWCOUNT=($(Window_GetCount "zandronum"))
    # if [ $WINDOWCOUNT -gt 4 ]
    #     echo "More windows than necessary detected... clearing all windows and starting over"
    #     SCREENLIST=($(Screen_GetList))
    #     for i in "${!SCREENLIST[@]}"; do
    #         echo "Terminating ${SCREENLIST[$i]}..."
    #         screen -S ${SCREENLIST[i]} -X quit
    #         sleep 1
    #     done
    #     Auto_Start_Servers
    #     return
    # fi
    # for i in "${!WINDOWLIST[@]}"; do
    #     echo "Checking ${WINDOWLIST[$i]}..."
    #     sleep 1
    # ISSERVER=($(Window_IsServer_Check))
    #     if [ ISSERVER -eq 0 ]; then
    #         echo "Server is not running on Window"
    #         Auto_Start_Servers
    #         return
    #     fi
    # ISACTIVE=($(Window_IsActive_Check)
}

# Auto_Check_Servers()
# {
#     echo "Checking all Servers..."
#     sleep 1
#     for key in "${!SERV_INFO[@]}"; do
#         IFS=',' read -r id field <<< "$key"
#         if [[ $field == "STATUS" ]]; then
#             echo "Checking ${SERV_INFO[$id,Name]} Server Status..."
#             echo ""
#             sleep 1
#             SERV_INFO[$key]=$($(check_server_status SERV_INFO[$id,Name] $id))
#             server_status="${SERV_INFO[$key]}"
#             sleep 1
#             if [ "$server_status" -eq "Offline" ]; then
#                 if [ $fix -eq 1 ]; then
#                     echo "${SERV_INFO[$id,Name]} Server is Offline... Running fix process..."
#                     fix_server "${SERV_INFO[$id,Name]}" $id
#                 else
#                     echo "${SERV_INFO[$id,Name]} Server is Offline"
#                     $SERV_INFO[$id,STATUS]="Offline"
#                     ALLOFFLINE=$((ALLOFFLINE+1))
#                     check_server_started "${SERV_INFO[$id,Name]}" $id
#                 fi
#             fi
#             echo ""
#             echo "${SERV_INFO[$id,Name]} Server Status: $server_status"
#         fi
#     done
#     sleep 1
#     echo "=================================="
#     echo "Server Check Process Completed"
#     echo "=================================="
#     sleep 1
# }