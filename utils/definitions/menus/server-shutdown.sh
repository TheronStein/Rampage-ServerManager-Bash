#Shutdown_Main_Menu: 
    #1. All  -> Confirmation_Menu
    #2.Specific -> Specific_Menu
    #3. Main Menu -> Main_Menu
#Specific_Menu:
    #Which Port? -> Confirmation_Menu
#Confirmation_Menu:
    # Yes -> End_Request(Request_Proc) -> Shutdown_Main_Menu
    # No -> Shutdown_Main_Menu

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