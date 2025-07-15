Screen_Stop_Proc()
{
    REQ="$1"
    ID=$2
    Write_Menu "Processing Screen Stop Request..."
    echo ""
    if [ $REQ = "all" ]; then
        echo "Stopping All Screens..."
        sleep 1
        Screen_Stop "$REQ" $ID
    elif [ $REQ = "rampage" ]; then
        echo "Stopping Rampage Zan Screens..."
        sleep 1
        Screen_Stop "$REQ" $ID
    elif [ $REQ = "specific" ]; then
        Menu_Screen_Select "stop"
    fi
    sleep 1
    echo "Outside of conditions... Returning to Main Menu..."
    sleep 1
    echo "..."
    Menu_Screen_Main
}
