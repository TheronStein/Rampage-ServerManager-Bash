# Window_Getlist_Init_Proc()
# {

        # if [ $ID2 -eq ${SCREENLIST[$i]} ]; then
        #     FOUND=1
        #     echo "=================================="
        #     echo "INTEGER MATCH!!!!!"
        #     echo "=================================="
        #     WINDOWLIST=($(Window_GetList $ID))
        #     sleep 1
        #     for i in "${!WINDOWLIST[@]}"; do
        #         echo "$i is ${WINDOWLIST[$i]}"
        #     done
        #     sleep 3
        #     echo "Returning to main menu..."
        #     Menu_Window_Main
        # fi
#             echo "Window Name: ${WINDOW_INFO["$ID,$i,WINDOWNAME"]}"
#                  if [ $i -eq 0 ] ; then
#                      WINDOW_INFO["$ID,$i,WINDOWNAME"]=${WINDALIST[$((i+1))]}
#                  elif [ $i -eq 1 ] ; then
#                      WINDOW_INFO["$ID,$i,WINDOWNAME"]=${WINDALIST[$((i+2))]}
#                  elif [ $i -gt 1 ] ; then
#                      WINDOW_INFO["$ID,$i,WINDOWNAME"]=${WINDALIST[$((i*2))]}
#                  fi
#              for i in "${!WINDOW_INFO["$ID,WINDOWCOUNT"]}"; do
#                  echo "${WINDOW_INFO["$ID,WINDOWID"]}"
#                  echo "${WINDOW_INFO["$ID,WINDOWID,WINDOWNAME"]}"
#              done
#              WINDOWLIST=($(Window_GetList "$ID"))
#              sleep 1
#              for i in "${!WINDOWLIST[@]}"; do
#                  echo "$i is ${WINDOWLIST[$i]}"
#              done
#              sleep 3
# }