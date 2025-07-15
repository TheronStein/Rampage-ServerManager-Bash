#!/bin/bash

check_server_status() {
    # Use pgrep and ps to check if zandronum-server is running in the specified screen window
    if screen -S zandronum -p "$1" -Q stuff "pgrep zandronum-server > /dev/null && echo 'running' || echo 'not running'" > /dev/null; then
        echo "Zandronum server is running in $1."
        return 0  # Success, server is running
    else
        echo "Zandronum server is not running in $1. Restarting..."
        return 1  # Failure, server is not running
    fi
}

create_window() {
    screen -S zandronum -X screen -t "$1"
}

execute_command() {
    screen -S zandronum -p "$1" -X eval "stuff \"$2\"$(printf '\015')"
}

perform_checks() {
    window="$1"
    command="$2"

    if check_server_status "$window"; then
        echo "Zandronum server is running in $window"
    else
        echo "Zandronum server is not running in $window. Restarting..."
        execute_command "$window" "cd zan32"
        execute_command "$window" "$command"
        # Additional delay to ensure the command is executed
        sleep 5
    fi
}

# Main execution
perform_checks "window1" "./zandronum-server -port 10666 -file /var/www/chaoscore/wads/rampagepriv-v3.pk3 /var/www/chaoscore/wads/ctfcap2d.pk3 /var/www/chaoscore/wads/hudtimer_v4fix.pk3 /var/www/chaoscore/wads/zandrospree2rc2.pk3 /var/www/chaoscore/wads/odaflagx.pk3 +exec rampagepriv.cfg +map map00" #Priv window1 command
perform_checks "window2" "./zandronum-server -port 10667 -file /var/www/chaoscore/wads/hudtimer_v4fix.pk3 /var/www/chaoscore/wads/odaflagx.pk3 /var/www/chaoscore/wads/zandrospree2rc2.pk3 /var/www/chaoscore/wads/rampagepriv-v4.pk3 /var/www/chaoscore/wads/rampagesuperpub-v2.pk3 +exec rampagenewpub.cfg" #Pub window2 command
perform_checks "window3" "./zandronum-server -port 10668 -file /var/www/chaoscore/wads/duel40b.pk3 /var/www/chaoscore/wads/zandrospree2rc2.pk3 /var/www/chaoscore/wads/clearlights.wad +exec rampageduel.cfg +map start" #Duel40 window3 command
perform_checks "window4" "./zandronum-server -port 10669 -file /var/www/chaoscore/wads/rampageduel-v1a.wad /var/www/chaoscore/wads/zandrospree2rc2.pk3 /var/www/chaoscore/wads/clearlights.wad /var/www/chaoscore/wads/hudtimer_v4fix.pk3 +exec rampageduel.cfg +map map00" #Duel rampage window4 command
perform_checks "window5" "./zandronum-server -port 10670 -file /var/www/chaoscore/wads/skulltag_content-3.0-beta01.pk3 /var/www/chaoscore/wads/stlmshnsv4.wad /var/www/chaoscore/wads/hnsv1.0.2.pk3 +exec rampagehns.cfg" #HNS  window5 command
# Add similar lines for other windows...

