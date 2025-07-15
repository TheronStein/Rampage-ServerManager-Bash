check_server_status() {
    # Clear the input buffer of the screen window
    screen -S zandronum -p "$1" -X clear
    sleep 2  # Increased delay

    # Run the zandronum-server application and send a command to check status
    screen -S zandronum -p "$1" -X stuff "sv_broadcast^M"
    sleep 2  # Increased delay

    # Wait for the command to be processed
    sleep 5  # Increased delay

    # Capture the output of the application from the window
    output=$(screen -S zandronum -p "$1" -X hardcopy -h "$HOME/zandronum_hardcopy_$1")

    # Check if the output indicates that the command is not found
    if grep -q "sv_broadcast: command not found" "$HOME/zandronum_hardcopy_$1"; then
        echo "Zandronum server is not running in $1. Restarting..."
        return 1  # Failure, server is not running
    else
        echo "Broadcast is set to true"
        return 0  # Success, server is running
    fi
    # Cleanup: Remove the temporary hardcopy file
    rm "$HOME/zandronum_hardcopy_$1"
}


# Function to check if a specific screen window exists
check_window_exists() {
    if screen -S zandronum -Q select "$1" > /dev/null; then
        return 0  # Success, window exists
    else
        return 1  # Failure, window does not exist
    fi
}

# Function to create a new screen window
create_window() {
    screen -S zandronum -X screen -t "$1"
}

# Function to execute the zandronum command in the specified window
execute_command() {
    screen -S zandronum -p "$1" -X eval "stuff \"$2\"$(printf '\015')"
}

# Function to perform the necessary checks and actions
perform_checks() {
    window="$1"
    command="$2"

    # Check if the window exists
    if check_window_exists "$window"; then
        echo "Window $window exists."
        
        # Check if the zandronum-server is running in the window
        if check_server_status "$window"; then
            echo "Zandronum server is running in $window"
        else
            echo "Zandronum server is not running in $window. Restarting..."
            execute_command "$window" "$command"
        fi
    else
        echo "Window $window does not exist. Creating..."
        create_window "$window"
        execute_command "$window" "cd zan32"
        execute_command "$window" "$command"
    fi
}

# Main execution
perform_checks "window1" "./zandronum-server -port 10666 -file /var/www/chaoscore/wads/rampagepriv-v3.pk3 /var/www/chaoscore/wads/ctfcap2d.pk3 /var/www/chaoscore/wads/hudtimer_v4fix.pk3 /var/www/chaoscore/wads/zandrospree2rc2.pk3 /var/www/chaoscore/wads/odaflagx.pk3 +exec rampagepriv.cfg +map map00" #Priv window1 command
perform_checks "window2" "./zandronum-server -port 10667 -file /var/www/chaoscore/wads/hudtimer_v4fix.pk3 /var/www/chaoscore/wads/odaflagx.pk3 /var/www/chaoscore/wads/zandrospree2rc2.pk3 /var/www/chaoscore/wads/rampagepriv-v4.pk3 /var/www/chaoscore/wads/rampagesuperpub-v2.pk3 +exec rampagenewpub.cfg" #Pub window2 command
perform_checks "window3" "./zandronum-server -port 10668 -file /var/www/chaoscore/wads/duel40b.pk3 /var/www/chaoscore/wads/zandrospree2rc2.pk3 /var/www/chaoscore/wads/clearlights.wad +exec rampageduel.cfg +map start" #Duel40 window3 command
perform_checks "window4" "./zandronum-server -port 10669 -file /var/www/chaoscore/wads/rampageduel-v1a.wad /var/www/chaoscore/wads/zandrospree2rc2.pk3 /var/www/chaoscore/wads/clearlights.wad /var/www/chaoscore/wads/hudtimer_v4fix.pk3 +exec rampageduel.cfg +map map00" #Duel rampage window4 command
perform_checks "window5" "./zandronum-server -port 10670 -file /var/www/chaoscore/wads/skulltag_content-3.0-beta01.pk3 /var/www/chaoscore/wads/stlmshnsv4.wad /var/www/chaoscore/wads/hnsv1.0.2.pk3 +exec rampagehns.cfg" #HNS  window5 command
perform_checks "window6" "./zandronum-server -port 10668 -file /var/www/chaoscore/wads/rampageduel-v1a.wad /var/www/chaoscore/wads/zandrospree2rc2.pk3 /var/www/chaoscore/wads/clearlights.wad /var/www/chaoscore/wads/hudtimer_v4fix.pk3 +exec rampageduela.cfg +map map00" #test  window6 command
perform_checks "window7" "./zandronum-server -port 10668 -file /var/www/chaoscore/wads/rampageduel-v1a.wad /var/www/chaoscore/wads/zandrospree2rc2.pk3 /var/www/chaoscore/wads/clearlights.wad /var/www/chaoscore/wads/hudtimer_v4fix.pk3 +exec rampageduelb.cfg +map map00" #test  window7 command
# Add similar lines for other windows...

