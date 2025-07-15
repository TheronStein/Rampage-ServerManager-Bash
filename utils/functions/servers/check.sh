Server_Check()
{
    REQ=$"1"
    local -i FOUND
    if [ "$REQ" = "active" ]; then
        FOUND=($(Window_Hardcopy_Handler "check" "$NAME" "$SESSIONNAME" "active"))
    else
        FOUND=($(Window_Hardcopy_Handler "check" "$NAME" "$SESSIONNAME" "server"))
    fi
    if [ $FOUND -eq 0 ]; then
        echo "found server..."
        return 1
    else
        echo "server not found..."
        return 0
    fi
    Error_Handler "Server_Check" "{MENU_NAMES["SERVER,FUNCTION"]}" "{MENU_NAMES["SERVER,STRING"]}" "$REQ" "$FOUND"
}


# Status_Show_All()
# {
#     if [ "$ALLOFFLINE" -gt 1 ]; then
#     echo "Number of Servers Online: $ALLONLINE"
#     echo "Number of Servers Offline: $ALLOFFLINE"
#         for key in "${!SERV_INFO[@]}"; do
#             IFS=',' read -r name field <<< "$key"
#             if [[ $field == "STATUS" ]]; then
#                 THISSTATUS=$SERV_INFO["$key"]
#                 echo  "$SERV_INFO[] Server is Offline"
#             fi
#         done
#     else
#         echo "All Servers Online"
#     fi
# }

# Server_Check_All()
# {
#     echo "Checking all Servers..."

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
#             echo ""
#         fi
#     done
#     if [ "$ALLOFFLINE" -gt 1 ]; then
#         echo "Unable to get all servers online..."
#         echo ""
#     else
#         echo "All Servers Online"
#     fi
#     echo "Server Check Process Complete"
#     echo ""
#     sleep 1
#     show_server_status
# }

# Server_Get_Status()
# {
#     NAME="$1"
#     ID="$2"
#     STATUS="$3"

#     if [ $STATUS = "ONLINE" ]; then
#         echo "Server $NAME | ID: $ID started successfully."
#     else
#         echo "Server $NAME | ID: $ID failed to start..."
#     fi
#     echo ""
#     sleep 1
#     rm "$HOME/zandronum_hardcopy_$NAME"
#     return $STATUS
#     # fix_server "$name" $id "$SERV_INFO["$name,STATUS"]" $SERV_INFO["$name,PORT"]
# }

# Server_Get_Activity()
# {
#     NAME="$1"
#     ID="$2"
#     Window_Write_PlayerInfo "$NAME"
#     grep '0.' "$HOME/zandronum_hardcopy_$NAME" > /dev/null 2>&1; FOUND=$?
#     if [ "$FOUND" -eq 1 ]; then
#         echo "Server $NAME | ID: $ID is Inactive..."
#         ACTIVITY="Inactive"
#     else
#         echo "Server $NAME | ID: $ID is Active with Players..."
#         ACTIVITY="Active"
#     fi
#     echo ""
#     sleep 1
#     rm "$HOME/zandronum_hardcopy_$NAME"
#     return $ACTIVITY
#     # fix_server "$name" $id "$SERV_INFO["$name,STATUS"]" $SERV_INFO["$name,PORT"]
# }