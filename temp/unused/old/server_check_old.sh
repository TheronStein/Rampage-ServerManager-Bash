#!/bin/bash

# Check if zandronum-server is running in the specified screen windows
check_screen_windows() {
    screen_windows=("window1" "window2" "window3" "window4" "window5")
    zandronum_commands=(
        "./zandronum-server -port 10666 -file /var/www/chaoscore/wads/rampagepriv-v3.pk3 /var/www/chaoscore/wads/ctfcap2d.pk3 /var/www/chaoscore/wads/hudtimer_v4fix.pk3 /var/www/chaoscore/wads/zandrospree2rc2.pk3 /var/www/chaoscore/wads/odaflagx.pk3 +exec rampagepriv.cfg +map map00" #Priv window1 command
        "./zandronum-server -port 10667 -file /var/www/chaoscore/wads/hudtimer_v4fix.pk3 /var/www/chaoscore/wads/odaflagx.pk3 /var/www/chaoscore/wads/zandrospree2rc2.pk3 /var/www/chaoscore/wads/rampagepriv-v4.pk3 /var/www/chaoscore/wads/rampagesuperpub-v2.pk3 +exec rampagenewpub.cfg" #Pub window2 command
        "./zandronum-server -port 10668 -file /var/www/chaoscore/wads/duel40b.pk3 /var/www/chaoscore/wads/zandrospree2rc2.pk3 /var/www/chaoscore/wads/clearlights.wad +exec rampageduel.cfg +map start" #Duel40 window3 command
        "/home/zandronum/zan32/zandronum-server -port 10669 -file /var/www/chaoscore/wads/rampageduel-v1a.wad /var/www/chaoscore/wads/zandrospree2rc2.pk3 /var/www/chaoscore/wads/clearlights.wad /var/www/chaoscore/wads/hudtimer_v4fix.pk3 +exec rampageduel.cfg +map map00" #Duel rampage window4 command
        "./zandronum-server -port 10670 -file /var/www/chaoscore/wads/skulltag_content-3.0-beta01.pk3 /var/www/chaoscore/wads/stlmshnsv4.wad /var/www/chaoscore/wads/hnsv1.0.2.pk3 +exec rampagehns.cfg" #HNS  window5 command
        #  "/path/to/sixth/command"   window6 command
    )

    for i in "${!screen_windows[@]}"; do
        window="${screen_windows[i]}"
        command="${zandronum_commands[i]}"
        status_file="/tmp/zandronum_status_$window"

        # Check if the status file doesn't exist or its content is not "running"
        if [[ ! -f "$status_file" || $(cat "$status_file") != "running" ]]; then
            echo "Zandronum server in $window is down. Restarting..."
            
            # Execute the command in the screen window using eval and stuff
            screen -S zandronum -p "$window" -X eval "stuff \"$command\"$(printf '\015')"
            
            # Mark the status file as "running"
            echo "running" > "$status_file"
            
            # Give some time for the server to start
            sleep 5
        else
            echo "Zandronum server in $window is already up."
        fi
    done
}

# Main execution
check_screen_windows

