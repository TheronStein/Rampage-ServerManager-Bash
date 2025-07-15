#!/bin/bash

# MENU FUNCTIONS: Menu_Window_Main, Menu_Window_Getlist
# WINDOW FUNCTIONS: Window_Init_Proc, Window_Getlist_Init_Proc

source $SRCDIR/handlers/Server-Window-Handler.sh
source $SRCDIR/handlers/Server-Screen-Handler.sh

Menu_Window_Getlist()
{
    REQ="$1"
    local -a SCREENLIST
    Menu_Display_Text MENU_NAMES["WINDOWLIST,STRING"]
    sleep 2
    SCREENLIST=($(Screen_GetList "all"))
    echo "All Active Sessions:"
    for i in "${!SCREENLIST[@]}"; do
        echo "      ${SCREENLIST[$i]}"
    done
    echo "What Session ID?"
    echo "Type 0 to go back to Main Menu"
    read -p "Enter ID: " OPTION
    case $OPTION in
        0) Main_Menu ;;
        *) Window_Getlist_Init_Proc "$OPTION" ;;
    esac
}