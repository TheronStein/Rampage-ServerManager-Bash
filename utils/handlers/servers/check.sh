Server_Check_Proc()
{
    REQ="$1"
    NAME="$2"
    SESSIONNAME="$3"
    local -i FOUND
    Window_Write "$NAME" "$SESSIONNAME" "clear" "Clearing Console...."
    sleep 1
    Window_Write "$NAME" "$SESSIONNAME" "playerinfo" "Pushing PlayerInfo Command...."
    sleep 1
    Window_Hardcopy_Handler "write" "$NAME" "$SESSIONNAME" ""
    sleep 1
    FOUND=($(Window_Check "$REQ"))
}