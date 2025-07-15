#!/bin/bash

# Auto_Start_Check()
# {
#     local -i SCREENCOUNT
#     SCREENCOUNT=($(Screen_Count "zandronum"))
#     if [ $SCREENCOUNT -gt 1 ]; then
#         echo "Multiple sessions detected... clearing all sessions and starting over"
#         SCREENLIST=($(Screen_GetList))
#         for i in "${!SCREENLIST[@]}"; do
#             echo "Terminating ${SCREENLIST[$i]}..."
#             screen -S ${SCREENLIST[i]} -X quit
#             sleep 1
#         done
#         Auto_Start_Servers
#         return
#     fi
# }

source $FUNCDIR/servers/start.sh

Boot_Server_Proc()
{
    Screen_Start "duels"
    sleep 2
    Window_Create "rduel" 0 "rampage"
    Window_Create "rduel" 1 "rampage"
    Window_Create "rduel" 2 "rampage"
    Window_Create "rduel" 3 "rampage"
    Window_Create "rduel" 4 "rampage"
    Window_Create "rduel" 5 "rampage"
    sleep 2
    # Server_Start "priv" 0 10666 "rampage"
    Server_Start "rduel" 1 10667 "rampage"
    Server_Start "rduel" 2 10668 "rampage"
    Server_Start "rduel" 3 10669 "rampage"
    Server_Start "rduel" 4 10670 "rampage"
    Server_Start "rduel" 5 10671 "rampage"
    sleep 2
}
