#!/bin/bash

configs=(
    #Priv
    '+exec /var/www/chaoscore/configs/global/dmflags.cfg /var/www/chaoscore/configs/global/svar.cfg /var/www/chaoscore/configs/modes/ctf.cfg /var/www/chaoscore/configs/priv.cfg +map map00 +compatflags 64'
    #Pub
    '+exec /var/www/chaoscore/configs/global/dmflags.cfg /var/www/chaoscore/configs/global/svar.cfg /var/www/chaoscore/configs/modes/ctf.cfg /var/www/chaoscore/configs/modes/pub.cfg /var/www/chaoscore/configs/superpub.cfg +compatflags 64'
    #Duel
    '+exec /var/www/chaoscore/configs/global/dmflags.cfg /var/www/chaoscore/configs/global/svar.cfg /var/www/chaoscore/configs/modes/duel.cfg /var/www/chaoscore/configs/duel40.cfg +map start +compatflags 536871714'
    #rduel
    '+exec /var/www/chaoscore/configs/global/dmflags.cfg /var/www/chaoscore/configs/global/svar.cfg /var/www/chaoscore/configs/modes/duel.cfg /var/www/chaoscore/configs/rduel.cfg +map map00 +lobby map00 +compatflags 536871714'
    #HNS
    '+exec /var/www/chaoscore/configs/global/dmflags.cfg /var/www/chaoscore/configs/global/svar.cfg /var/www/chaoscore/configs/modes/hns.cfg /var/www/chaoscore/configs/extra/unblock.cfg /var/www/chaoscore/configs/extra/forcegl.cfg /var/www/chaoscore/configs/extra/stats.cfg +compatflags 64'
    #Veng
    '+exec /var/www/chaoscore/configs/global/dmflags.cfg /var/www/chaoscore/configs/global/svar.cfg /var/www/chaoscore/configs/modes/ctf.cfg /var/www/chaoscore/configs/priv.cfg +map map00 +compatflags 64'
    #LGduel
    '+exec /var/www/chaoscore/configs/global/dmflags.cfg /var/www/chaoscore/configs/global/svar.cfg /var/www/chaoscore/configs/modes/duel.cfg /var/www/chaoscore/configs/duel40.cfg /var/www/chaoscore/configs/modes/lg.cfg +map start +compatflags 536871714'
)

#Veng
veng_configs=(
    '+exec /var/www/chaoscore/configs/global/dmflags.cfg /var/www/chaoscore/configs/global/svar.cfg /var/www/chaoscore/configs/modes/ctf.cfg /var/www/chaoscore/configs/priv.cfg +map map00 +compatflags 64'
    '+exec /var/www/chaoscore/configs/global/dmflags.cfg /var/www/chaoscore/configs/global/svar.cfg /var/www/chaoscore/configs/modes/ctf.cfg /var/www/chaoscore/configs/priv.cfg +map LOCKER +compatflags 64'
)
