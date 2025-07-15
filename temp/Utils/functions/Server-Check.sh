


Server_Check_Proc()
{
    echo "=================================="
    echo "Initializing Server Start Process..."
    echo "=================================="
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
