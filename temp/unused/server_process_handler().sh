Server_Process_Handler()
{
    PROC=$1
    #first check the screen sessions...
    SCREENUM=
    SCREENEXIST=($(Screen_Check))
    echo "Number of Screens: $SCREENUM"
    echo "Screen Exist: $SCREENEXIST"
    echo ""

    if [ $SCREENUM -eq 0]; then
        echo "No screen sessions exist..."
        if ["$PROC" = "stop" || "restart" || "status"]; then
            echo "Nothing exists... Back to main menu..."
            echo ""
            Main_menu
        fi
        if ["$PROC" = "start" || "check" ]; then
            if [ "$PROC" -nt "start" ]; then
                echo "Nothing exists... Initializing Start Process..."
                echo ""
                sleep 1
                Screen_Check
            fi
            Server_Start_Proc
        fi
    fi

    if [SCREENUM=($(Screen_count)) &&  -eq 1]; then
        if ["$PROC" = "start" || "restart"]; then
            echo "Server is already Online"
            echo "Back to main menu..."
            echo ""
            Main_menu
        fi
            if ["$PROC" = "stop"]; then
                Server_Stop_Proc
            fi
            if ["$PROC" = "restart"]; then
                Server_Restart_Proc
            fi
            if ["$PROC" = "check"]; then
                Server_Check_Proc
            fi
            if ["$PROC" = "fix"]; then
                Server_Fix_Proc
            fi
            if ["$PROC" = "status"]; then
                Server_Status_Proc
            fi
        else
            echo "Server is Offline"
        if ["$PROC" = "start"]; then
            Screen_Check
        fi
        if ["$PROC" = "stop"]; then
            
            Server_Stop_Proc
        fi
        if ["$PROC" = "restart"]; then
            Server_Restart_Proc
        fi
        if ["$PROC" = "check"]; then
            Server_Check_Proc
        fi
        if ["$PROC" = "fix"]; then
            Server_Fix_Proc
        fi
        if ["$PROC" = "status"]; then
            Server_Status_Proc
        fi
    fi

    if $SCREENCHECKED -eq 0; then
        echo "=================================="
        echo "Initial Check Process..."
        echo "=================================="
        screen_handler_check $PROCESS
    fi
    break
}