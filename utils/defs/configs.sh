#!/bin/bash
# configs.sh - Configuration strings for different server types

CONFIG=/var/www/chaoscore/configs
GLOBAL=${CONFIG}/global
MODES=${CONFIG}/modes
EXTRA=${CONFIG}/extra
VENG=${CONFIG}/veng

configs=(
    #Priv
    "+exec ${GLOBAL}/dmflags.cfg ${GLOBAL}/svar.cfg ${MODES}/ctf.cfg ${CONFIG}/priv.cfg +map map00 +compatflags 64"
    #Pub
    "+exec ${GLOBAL}/dmflags.cfg ${GLOBAL}/svar.cfg ${MODES}/pub.cfg ${CONFIG}/superpub.cfg +compatflags 64"
    #Duel
    "+exec ${GLOBAL}/dmflags.cfg ${GLOBAL}/svar.cfg ${MODES}/duel.cfg ${CONFIG}/duel40.cfg +map start +compatflags 536871714"
    #rduel
    "+exec ${GLOBAL}/dmflags.cfg ${GLOBAL}/svar.cfg ${MODES}/duel.cfg ${CONFIG}/rduel.cfg +map map00 +lobby map00 +compatflags 536871714"
    #HNS
    "+exec ${GLOBAL}/dmflags.cfg ${GLOBAL}/svar.cfg ${MODES}/hns.cfg ${EXTRA}/unblock.cfg ${EXTRA}/forcegl.cfg ${EXTRA}/stats.cfg +compatflags 64"
    #Veng
    "+exec ${GLOBAL}/dmflags.cfg ${GLOBAL}/svar.cfg ${MODES}/ctf.cfg ${CONFIG}/priv.cfg +map map00 +compatflags 64"
    #LGduel
    "+exec ${GLOBAL}/dmflags.cfg ${GLOBAL}/svar.cfg ${MODES}/duel.cfg ${CONFIG}/duel40.cfg ${MODES}/lg.cfg +map start +compatflags 536871714"
)

#Veng
veng_configs=(
    "+exec ${GLOBAL}/dmflags.cfg ${GLOBAL}/svar.cfg ${MODES}/ctf.cfg ${VENG}/veng.cfg ${VENG}/veng_\${veng_season[\$VENG_WEEKNUM]}.cfg +compatflags 64"
    "+exec ${GLOBAL}/dmflags.cfg ${GLOBAL}/svar.cfg ${MODES}/ctf.cfg ${VENG}/veng.cfg ${VENG}/veng_\${veng_season[\$VENG_WEEKNUM]}.cfg +map LOCKER +compatflags 64"
)

# configs=(
#     #Priv
#     "+exec \
# ${GLOBAL}/dmflags.cfg \
# ${GLOBAL}/svar.cfg \
# ${MODES}/ctf.cfg \
# ${CONFIG}/priv.cfg \
# +map map00 +compatflags 64"
#     #Pub
#     "+exec \
# ${GLOBAL}/dmflags.cfg \
# ${GLOBAL}/svar.cfg \
# ${MODES}/pub.cfg \
# ${CONFIG}/superpub.cfg \
# +compatflags 64"
#     #Duel
#     "+exec \
# ${GLOBAL}/dmflags.cfg \
# ${GLOBAL}/svar.cfg \
# ${MODES}/duel.cfg \
# ${CONFIG}/duel40.cfg \
# +map start +compatflags 536871714"
#     #rduel
#     "+exec \
# ${GLOBAL}/dmflags.cfg \
# ${GLOBAL}/svar.cfg \
# ${MODES}/duel.cfg \
# ${CONFIG}/rduel.cfg \
# +map map00 +lobby map00 +compatflags 536871714"
#     #HNS
#     "+exec \
# ${GLOBAL}/dmflags.cfg \
# ${GLOBAL}/svar.cfg \
# ${MODES}/hns.cfg \
# ${EXTRA}/unblock.cfg \
# ${EXTRA}/forcegl.cfg \
# ${EXTRA}/stats.cfg \
# +compatflags 64"
#     #Veng
#     "+exec \
# ${GLOBAL}/dmflags.cfg \
# ${GLOBAL}/svar.cfg \
# ${MODES}/ctf.cfg \
# ${CONFIG}/priv.cfg \
# +map map00 +compatflags 64"
#     #LGduel
#     "+exec \
# ${GLOBAL}/dmflags.cfg \
# ${GLOBAL}/svar.cfg \
# ${MODES}/duel.cfg \
# ${CONFIG}/duel40.cfg \
# ${MODES}/lg.cfg \
# +map start +compatflags 536871714"
# )
#
# #Veng
# veng_configs=(
#     "+exec \
# ${GLOBAL}/dmflags.cfg \
# ${GLOBAL}/svar.cfg \
# ${MODES}/ctf.cfg \
# ${VENG}/veng.cfg \
# ${VENG}/veng_\${veng_season[\$VENG_WEEKNUM]}.cfg \
# +map map00 +compatflags 64"
#     "+exec \
# ${GLOBAL}/dmflags.cfg \
# ${GLOBAL}/svar.cfg \
# ${MODES}/ctf.cfg \
# ${VENG}/veng.cfg \
# ${VENG}/veng_\${veng_season[\$VENG_WEEKNUM]}.cfg \
# +map LOCKER +compatflags 64"
# )
