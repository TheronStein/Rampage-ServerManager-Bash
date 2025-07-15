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

veng_configs=(
    #Veng Practice
    '/var/www/chaoscore/wads/rampagepriv-v6-1.pk3 /var/www/chaoscore/wads/vengeancemaps_v1.06.pk3 /var/www/chaoscore/wads/vengeanceweapons_v1.53.pk3 /var/www/chaoscore/wads/rampage-stats-fix.pk3 /var/www/chaoscore/wads/ctfcap2d.pk3 /var/www/chaoscore/wads/hudtimer_v4fix.pk3 /var/www/chaoscore/wads/zandrospree2rc2.pk3 /var/www/chaoscore/wads/odaflagx.pk3'
    #Veng Game
    '/var/www/chaoscore/wads/rampagepriv-v6-1.pk3 /var/www/chaoscore/wads/vengeancemaps_v1.06.pk3 /var/www/chaoscore/wads/vengeanceweapons_v1.53.pk3 /var/www/chaoscore/wads/rampage-stats-fix.pk3 /var/www/chaoscore/wads/rampage_lockers.pk3 /var/www/chaoscore/wads/ctfcap2d.pk3 /var/www/chaoscore/wads/hudtimer_v4fix.pk3 /var/www/chaoscore/wads/zandrospree2rc2.pk3 /var/www/chaoscore/wads/odaflagx.pk3'
)
