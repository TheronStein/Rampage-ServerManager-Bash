declare -A SERV_INFO

SERV_INFO["PRIV,ID"]=0
SERV_INFO["PRIV,NAME"]="Priv"
SERV_INFO["PRIV,STATUS"]="null"
SERV_INFO["PRIV,PORT"]="10666"

SERV_INFO["PUB,ID"]=1
SERV_INFO["PUB,NAME"]="Pub"
SERV_INFO["PUB,STATUS"]="null"
SERV_INFO["PUB,PORT"]="10667"

SERV_INFO["DUEL,ID"]=2
SERV_INFO["DUEL,NAME"]="Duel"
SERV_INFO["DUEL,STATUS"]="null"
SERV_INFO["DUEL,PORT"]="10668"

SERV_INFO["RDUEL,ID"]=3
SERV_INFO["RDUEL,NAME"]="RDuel"
SERV_INFO["RDUEL,STATUS"]="null"
SERV_INFO["RDUEL,PORT"]="10669"

SERV_INFO["HNS,ID"]=4
SERV_INFO["HNS,NAME"]="HNS"
SERV_INFO["HNS,STATUS"]="null"
SERV_INFO["HNS,PORT"]="10670"

test_function() {
for key in "${!SERV_INFO[@]}"; do
    IFS=',' read -r id field <<< "$key"
    if [[ $field == "NAME" ]]; then
        server_name="${SERV_INFO[$key]}"
        echo "Server ID: $id"
        echo "Server Name: $server_name"
        echo "Server Port: ${SERV_INFO[$id,PORT]}"
        echo "Server Status: ${SERV_INFO[$id,STATUS]}"
        # create_window "${SERV_INFO[$key]}" i
    fi
done
}

test_function