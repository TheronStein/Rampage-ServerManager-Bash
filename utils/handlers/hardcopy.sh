Window_Hardcopy_Handler()
{
    REQ="$1"
    WINNAME="$2"
    SESSNAME="$3"
    CHECK="$4"
    COMMANDSTRING="$5"

    if [ "$REQ" = "write" ]; then
        output=$(screen -S $SESSNAME -p $WINNAME -X hardcopy -h "$CONSDIR/rampage_hardcopy_$NAME")
    elif [ "$REQ" = "remove" ]; then
        rm "$CONSDIR/rampage_hardcopy_$NAME"
    elif [ "$REQ" = "check" ]; then
        if [ "$CHECK" = "server" ]; then
            grep '"command not found"' "/home/rampage/rampage_hardcopy_$NAME" > /dev/null 2>&1; FOUND=$?
        elif [ "$CHECK" = "active" ]; then
            grep 'k0.' "$CONSDIR/rampage_hardcopy_$NAME" > /dev/null 2>&1; FOUND=$?
        fi
        echo $FOUND
    fi
    Error_Handler "Out of Bounds" "Window_Hardcopy_Handler" "{MENU_NAMES["WINDOW,FUNCTION"]}" "{MENU_NAMES["WINDOW,STRING"]}" "$NAME" "$FOUND"
}