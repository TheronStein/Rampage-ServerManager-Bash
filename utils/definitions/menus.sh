declare -A MENU_NAMES

#Main Menu
MENU_NAMES["MAIN,TITLE"]="Main"
MENU_NAMES["MAIN,FUNC"]="Main_Menu"
MENU_NAMES["SERVSTART,OPTNUM"]=5

#These menu options will handle all of the basic commands 
# MENU_OPTIONS["MAIN,OPT1"]="Start Servers"
# MENU_OPTIONS["MAIN,OPT2"]="Shutdown Servers"
# MENU_OPTIONS["MAIN,OPT3"]="Reset Servers"
# MENU_OPTIONS["MAIN,OPT4"]="Server Status"
# MENU_OPTIONS["MAIN,OPT5"]="Server Troubleshooting"

# String Menu_Name
# int choiceLimit = 8

# def menu_options[Menu_Name][choiceLimit] 
# menus[Server_Start][0]="Start Servers"
# menus[Server_Start][1]="Shutdown Servers"
# menus[Server_Start][2]="Reset Servers"
# menus[Server_Start][3]="Server Status"
# menus[Server_Start][4]="Server Troubleshooting"

#Server Shutdown
MENU_NAMES["SERVSHUTDOWN,TITLE"]="Server Shutdown"
MENU_NAMES["SERVSHUTDOWN,FUNC"]="Menu_Shutdown_Servers"
MENU_NAMES["SERVSHUTDOWN,OPTNUM"]=2

MENU_OPTIONS["SERVSHUTDOWN,OPT1"]="Shutdown Specific Server"
MENU_OPTIONS["SERVSHUTDOWN,OPT2"]="Shutdown All Servers"

#Server Shutdown Specific
MENU_NAMES["SERVSHUTCONF,TITLE"]="Server Shutdown Specific"
MENU_NAMES["SERVSHUTCONF,FUNC"]="Menu_Shutdown_Specific"
MENU_NAMES["SERVSHUTCONF,OPTNUM"]=1

MENU_OPTIONS["SERVSHUTDOWN,OPT1"]="Which server would you like to shut down?"

#Server Shutdown Confirmation
MENU_NAMES["SERVSHUTCONF,TITLE"]="Server Shutdown Confirmation"
MENU_NAMES["SERVSHUTCONF,FUNC"]="Menu_Shutdown_Confirmation"
MENU_NAMES["SERVSHUTCONF,OPTNUM"]=2

MENU_OPTIONS["SERVSHUTDOWN,OPT1"]="Yes"
MENU_OPTIONS["SERVSHUTDOWN,OPT2"]="No"

PROCESS_REQUESTS["SERV,SHUTDOWN"]="Server_Shutdown_All"
PROCESS_REQUESTS["SERV,SHUTDOWN"]="Server_Shutdown_Specific"

#Server Start
MENU_NAMES["SERVSTART,TITLE"]="Server Start"
MENU_NAMES["SERVSTART,FUNC"]="Menu_Start_Servers"
MENU_NAMES["SERVSTART,OPTNUM"]=2

MENU_OPTIONS["SERVSTART,OPT1"]="Start New Server"
MENU_OPTIONS["SERVSTART,OPT2"]="Start New Set of Servers"





#SERVER MENUS
MENU_NAMES["SERVER_START,STRING"]="Start Server"
MENU_NAMES["SERVER_START,FUNCTION"]="Menu_Start_Servers"
MENU_NAMES["SERVER_STOP,STRING"]="Stop Server"
MENU_NAMES["SERVER_STOP,FUNCTION"]="Menu_Stop_Servers"
MENU_NAMES["SERVER_RESET,STRING"]="Restart Server"
MENU_NAMES["SERVER_RESET,FUNCTION"]="Menu_Reset_Servers"
MENU_NAMES["SERVER_CHECK,STRING"]="Check and Fix Server"
MENU_NAMES["SERVER_CHECK,FUNCTION"]="Menu_Check_Servers"

MENU_NAMES["SERVER_STATUS,STRING"]="Server Status"
MENU_NAMES["SERVER_STATUS,FUNCTION"]="Menu_Display_Servers"
#SCREEN MENUS

#MENU_NAMES["SCREEN,LEVEL"]="MAIN"

#Write_Menu "Screen Session" "Options" "SCREEN"

MENU_NAMES["SCREEN_MAIN,OBJECT"]="SCREEN"
MENU_NAMES["SCREEN_MAIN,IDEN"]="Main"
MENU_NAMES["SCREEN_MAIN,TYPE"]="Menu"
MENU_NAMES["SCREEN_MAIN,TITLE"]="Screen Sessions"
MENU_NAMES["SCREEN_MAIN,FUNC"]="Menu_Screen_Main" # Options or Menu
MENU_NAMES["SCREEN_MAIN,MENUSTRING"]="{$MENU_NAMES["SCREEN_MAIN,IDEN"]} {$MENU_NAMES["SCREEN_MAIN,TYPE"]}"


# Write_Menu()
# {
#     NAME="$1"
#     TITLE="$2"
#     TYPE="$3"
#     MENU_NAMES["$TYPE,STRING"]=$NAME
#     NAME=MENU_NAMES["$NAME,STRING"]
#     Text_Divider
#     echo "$NAME Menu"
#     Text_Divider
#     sleep 2
# }



#WINDOW MENUS
MENU_NAMES["WINDOW,STRING"]="Window Options"
MENU_NAMES["WINDOW,FUNCTION"]="Menu_Window_Main"
MENU_NAMES["WINDOWLIST,STRING"]="Screen Session Selection"
MENU_NAMES["WINDOWLIST,FUNCTION"]="Menu_Window_Getlist"



# declare -a SELECTION

# SELECTION[0]="start"
# SELECTION[1]="stop"
# SELECTION[2]="restart"
# SELECTION[3]="check"
# SELECTION[4]="status"
# SELECTION[5]="exit"
# declare -a STARTSEL
# STARTSEL[0]="all"
# STARTSEL[1]="serverid"
# STARTSEL[2]="newserver"

# declare -a STOPSEL
# STOPSEL[0]="all"
# STOPSEL[1]="sessionid"
# STOPSEL[2]="serverid"

# declare -a RESTARTSEL
# RESTARTSEL[0]="all"
# RESTARTSEL[1]="serverid"

# declare -a CHECKSEL
# CHECKSEL[0]="all"
# CHECKSEL[1]="serverid"

# declare -a STATUSSEL
# STATUSSEL[0]="all"
# STATUSSEL[1]="serverid"