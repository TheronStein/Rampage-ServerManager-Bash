#!/bin/bash

# Exit and Error Handler Functions
# FUNCTIONS: Program_Exit, Program_Error_Exit, Error_Handler

Error_Handler()
{
    ERRORTYPE="$1"
    FUNCTIONNAME="$2"
    RETURNMENU="$3"
    RETURNMENUSTRING="$4"
    VAR1="$5"
    VAR2="$6"
    VAR3="$7"
    echo ""
    echo "Error Detected: $ERRORTYPE on $FUNCTIONNAME..."
    sleep 1
    if [ "$VAR1" ]; then
        echo "No Variables Passed..."
       
    fi
    if [ -n "$VAR1" ]; then
        echo "Variable Checks..."
        sleep 1
        echo "VAR1: $VAR1"
        sleep 1
        if [ -z "$VAR2"]; then
            echo "VAR2: $VAR2"
            sleep 1
            if [ -z "$VAR3" ]; then
                echo "VAR3: $VAR3"
                sleep 1
            fi
        fi
    else
        echo "No Variables Passed..."
         if [ -n "$VAR2" ] || [ -n "$VAR3" ]; then
            if [ -n "$VAR2" ]; then
                if [ -n "$VAR3" ]; then
                    echo "Variable 2 & 3 is not null, but Variable 1 is null..."
                    sleep 1
                    echo "Exiting program..."
                    sleep 1
                    exit
                fi
                Program_Exit "Error Handler Crash" ""Variable 2 is not null, but Variable 1 is null..."

            fi
            if [ -n "$VAR3" ]; then
                Program_Exit "Error Handler Crash" ""Variable 2 is not null, but Variable 1 is null..."
            fi
        fi
    fi
    echo "Returning to $RETURNMENUSTRING Menu..."
    sleep 2
    $RETURNMENU
}