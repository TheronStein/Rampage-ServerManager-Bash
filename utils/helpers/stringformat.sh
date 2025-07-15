Write_Menu()
{
    NAME="$1"
    TITLE="$2"
    TYPE="$3"
    MENU_NAMES["$TYPE,TITLE"]=$NAME
    NAME=MENU_NAMES["$NAME,TITLE"]
    Write_Divider
    echo "$NAME Menu"
    Write_Divider
    sleep 2
}

Write_Divider()
{
    echo "=================================="
}

Return_Menu()
{
    FUNCTIONNAME="$1"
    NAME="$2"
    sleep 1
    echo ""
    echo "Returning to $NAME Menu..."
    sleep 2
    $FUNCTIONNAME
}
