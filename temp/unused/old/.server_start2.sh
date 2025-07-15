#!/bin/bash"

# Explicitly set the PATH variable
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Enable error handling
set -e

# Example debugging output
echo "Script is running..."

# Check if the script is running as the correct user
if [ "$(whoami)" != "zandronum" ]; then
  echo "This script must be run as the "zandronum" user."
  exit 1
fi

# Define the commands to be executed in each screen window
commands=(
"/home/zandronum/zan32/zandronum-server -port 10666 -file /var/www/rampage/wads/rampagepriv-v4-1.pk3 /var/www/rampage/wads/ctfcap2d.pk3 /var/www/rampage/wads/hudtimer_v4fix.pk3 /var/www/rampage/wads/zandrospree2rc2.pk3 /var/www/rampage/wads/odaflagx.pk3 +exec /var/www/rampage/configs/global/dmflags.cfg +exec /var/www/rampage/configs/global/svar.cfg +exec /var/www/rampage/configs/modes/ctf.cfg +exec /var/www/rampage/configs/priv.cfg +map map00 +sv_hostname ":: [NY] = RAMPAGE :: Private CTF  = ::"" #Priv
"/home/zandronum/zan32/zandronum-server -port 10667 -file /var/www/rampage/wads/hudtimer_v4fix.pk3 /var/www/rampage/wads/odaflagx.pk3 /var/www/rampage/wads/zandrospree2rc2.pk3 /var/www/rampage/wads/rampagepriv-v4-1.pk3 /var/www/rampage/wads/rampagesuperpub-v2.pk3 +exec /var/www/rampage/configs/global/dmflags.cfg +exec /var/www/rampage/configs/global/svar.cfg +exec /var/www/rampage/configs/modes/ctf.cfg +exec /var/www/rampage/configs/modes/pub.cfg +exec /var/www/rampage/configs/superpub.cfg +sv_hostname ":: [NY] = RAMPAGE :: Public CTF = ::"" #Pub
"/home/zandronum/zan32/zandronum-server -port 10668 -file /var/www/rampage/wads/duel40b.pk3 /var/www/rampage/wads/zandrospree2rc2.pk3 /var/www/rampage/wads/clearlights.wad +exec /var/www/rampage/configs/global/dmflags.cfg+exec /var/www/rampage/configs/global/svar.cfg +exec /var/www/rampage/configs/modes/duel.cfg +exec /var/www/rampage/configs/duel40db.cfg +map start +sv_hostname ":: [NY] = RAMPAGE :: Duel40 = ::"" #Duel40
"/home/zandronum/zan32/zandronum-server -port 10669 -file /var/www/rampage/wads/rampageduel-v1a.wad /var/www/rampage/wads/zandrospree2rc2.pk3 /var/www/rampage/wads/clearlights.wad /var/www/rampage/wads/hudtimer_v4fix.pk3+exec /var/www/rampage/configs/global/dmflags.cfg +exec /var/www/rampage/configs/global/svar.cfg +exec /var/www/rampage/configs/modes/duel.cfg +exec /var/www/rampage/configs/rduel.cfg +map map00 +sv_hostname ":: [NY] = RAMPAGE :: Rampage Duel = ::"" #Duel rampage
"/home/zandronum/zan32/zandronum-server -port 10670 -file /var/www/rampage/wads/skulltag_content-3.0-beta01.pk3 /var/www/rampage/wads/stlmshnsv4.wad/var/www/rampage/wads/hnsv1.0.2.pk3 +exec /var/www/rampage/configs/global/dmflags.cfg +exec /var/www/rampage/configs/global/svar.cfg +exec /var/www/rampage/configs/modes/hns.cfg +exec /var/www/rampage/configs/extra/allowteams.cfg +exec /var/www/rampage/configs/extra/unblock.cfg +exec/var/www/rampage/configs/extra/forcegl.cfg +exec/var/www/rampage/configs/extra/stats.cfg +sv_hostname ":: [NY] = RAMPAGE :: Hide n Seek = ::"" #HNS
)
#FragFest Server "echo "Executing Command 6""

# Function to create a screen session with windows
create_screen_session() {
  # Log file path
  log_file="/home/zandronum/server_start.log"

  # Kill existing zandronum sessions and log the actions
  screen -ls | awk "/\.zandronum/ {print $1}" | xargs -I {} screen -X -S {} quit >> "$log_file" 2>&1

  # Create a new detached screen session named "zandronum" and log the action
  screen -dmS zandronum >> "$log_file" 2>&1

  # Wait for a short time to ensure the screen session is created
  sleep 1

  # Add windows to the "zandronum" screen session with the specified commands
  screen -S zandronum -X screen -t window
  screen -S zandronum -X screen -t window2
  screen -S zandronum -X screen -t window3
  screen -S zandronum -X screen -t window4
  screen -S zandronum -X screen -t window5
	screen -S zandronum -p window1 -X stuff "cd zan32\n"
	screen -S zandronum -p window2 -X stuff "cd zan32\n"
	screen -S zandronum -p window3 -X stuff "cd zan32\n"
	screen -S zandronum -p window4 -X stuff "cd zan32\n"
	screen -S zandronum -p window5 -X stuff "cd zan32\n"
	screen -S zandronum -p window1 -X eval "stuff \"${commands[0]}\015\""
	screen -S zandronum -p window2 -X eval "stuff \"${commands[1]}\015\""
	screen -S zandronum -p window3 -X eval "stuff \"${commands[2]}\015\""
	screen -S zandronum -p window4 -X eval "stuff \"${commands[3]}\015\""
	screen -S zandronum -p window5 -X eval "stuff \"${commands[4]}\015\""
	}


# Main execution
create_screen_session

