#!/bin/bash
# source $MENUDIR/main.sh

# source $DEFDIR/config.sh
# source $DEFDIR/files.sh
# source $DEFDIR/menus.sh
# source $DEFDIR/screens.sh
# source $DEFDIR/servers.sh
# source $DEFDIR/windows.sh

# source $HELPDIR/menuformat.sh
# source $HELPDIR/stringformat.sh

# source $HANDIR/init.sh
# source $HANDIR/timed/boot-start.sh
# source $HANDIR/timed/hourly-check.sh

# source $FUNCDIR/windows.sh
# source $FUNCDIR/screens.sh
# source $FUNCDIR/servers/start.sh
# source $FUNCDIR/servers/stop.sh
# source $FUNCDIR/servers/reset.sh
# source $FUNCDIR/servers/check.sh

# Explicitly set the PATH variable
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
set +e

declare SRCDIR="$HOME/ServerManager"
source $SRCDIR/utils/global-import.sh

Program_Start() {
    # echo "$SRCDIR"
    # echo "$MENUDIR"
    # echo "$DEFDIR"
    # echo "$FUNCDIR"
    # echo "$HANDIR"
    # echo "$LOGDIR"
    # echo "$TEMPDIR"
    # Main execution
    if [ $ARG1 -eq 1 ]; then
        Boot_Server_Proc
        Program_Exit
    elif [ -z $ARG1 ]; then
        ${MENU_NAMES["MAIN,FUNC"]}
        Program_Exit
    elif [ $ARG1 -eq 2 ]; then
        Hourly_Check_Proc
        Program_Exit
    elif [ $ARG1 -eq 3 ]; then
        Boot_Server_Proc
        Boot_Servers_Veng $VENG_WEEKNUM
        Program_Exit
        #    elif [ $ARG -eq 3 ]; then
        # Custom_Server_Proc
        # Program_Exit
    else
        Error_Handler "Invalid Argument" "Program_Start" "${MENU_NAMES["MAIN,FUNC"]}" "${MENU_NAMES["MAIN,STRING"]}" "$ARG1"
    fi
    Program_Error_Exit "Out of Bounds" "Program_Start" "Reached Out of Bounds in $2..."
    #Error_Handler "Out of Bounds" "Program Start" "${MENU_NAMES["MAIN,FUNCTION"]}" "${MENU_NAMES["MAIN,STRING"]}" "$ARG1"
}

Program_Error_Exit() {
    TYPE="$1"
    FUNCTION="$2"
    MESSAGE="$3"
    Write_Menu $TYPE
    sleep 2
    echo "From: $FUNCTION"
    sleep 2
    echo "Error Message: $MESSAGE"
    sleep 2
    Program_Exit
}

Program_Exit() {
    Write_Divider
    echo "Exiting Program..."
    Write_Divider
    sleep 2
    exit
}

ARG1=$1
Program_Start $ARG1
Program_Error_Exit "App Exeuction: Out of Bounds" "None" "Reached out of bounds in main execution..."
