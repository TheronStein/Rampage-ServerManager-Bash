#!/bin/bash
# wads.sh - WAD file lists for different server configurations

WAD_PATH=/var/www/chaoscore/wads

wadlist=(
    #Priv
    "${WAD_PATH}/rampagepriv-v6-1.pk3 ${WAD_PATH}/rampage-stats-fix.pk3 ${WAD_PATH}/ctfcap2d.pk3 ${WAD_PATH}/hudtimer_v4fix.pk3 ${WAD_PATH}/zandrospree2rc2.pk3 ${WAD_PATH}/odaflagx.pk3"
    #Pub
    "${WAD_PATH}/hudtimer_v4fix.pk3 ${WAD_PATH}/odaflagx.pk3 ${WAD_PATH}/zandrospree2rc2.pk3 ${WAD_PATH}/rampagepriv-v5-1.pk3 ${WAD_PATH}/rampagesuperpub-v3.pk3 ${WAD_PATH}/rampage-stats-fix.pk3"
    #Duel
    "${WAD_PATH}/duel40b.pk3 ${WAD_PATH}/zandrospree2rc2.pk3 ${WAD_PATH}/clearlights.wad"
    #rduel
    "${WAD_PATH}/duel40b.pk3 ${WAD_PATH}/zandrospree2rc2.pk3 ${WAD_PATH}/clearlights.wad"
    #HNS
    "${WAD_PATH}/skulltag_content-3.0-beta01.pk3 ${WAD_PATH}/stlmshnsv4.wad ${WAD_PATH}/hnsv1.0.2.pk3"
    #Veng
    "${WAD_PATH}/rampagepriv-v6-1.pk3 ${WAD_PATH}/vengeancemaps_v1.06.pk3 ${WAD_PATH}/vengeanceweapons_v1.53.pk3 ${WAD_PATH}/rampage-stats-fix.pk3 ${WAD_PATH}/ctfcap2d.pk3 ${WAD_PATH}/hudtimer_v4fix.pk3 ${WAD_PATH}/zandrospree2rc2.pk3 ${WAD_PATH}/odaflagx.pk3"
    #LGduel
    "${WAD_PATH}/duel40b.pk3 ${WAD_PATH}/lgmod.pk3 ${WAD_PATH}/zandrospree2rc2.pk3 ${WAD_PATH}/clearlights.wad"
)

veng_wadlist=(
    "${WAD_PATH}/rampagepriv-v6-1.pk3 ${WAD_PATH}/vengeancemaps_v1.06.pk3 ${WAD_PATH}/vengeanceweapons_v1.53.pk3 ${WAD_PATH}/rampage-stats-fix.pk3 ${WAD_PATH}/ctfcap2d.pk3 ${WAD_PATH}/hudtimer_v4fix.pk3 ${WAD_PATH}/zandrospree2rc2.pk3 ${WAD_PATH}/odaflagx.pk3"
    "${WAD_PATH}/rampagepriv-v6-1.pk3 ${WAD_PATH}/vengeancemaps_v1.06.pk3 ${WAD_PATH}/vengeanceweapons_v1.53.pk3 ${WAD_PATH}/rampage-stats-fix.pk3 ${WAD_PATH}/rampage_lockers.pk3 ${WAD_PATH}/ctfcap2d.pk3 ${WAD_PATH}/hudtimer_v4fix.pk3 ${WAD_PATH}/zandrospree2rc2.pk3 ${WAD_PATH}/odaflagx.pk3"
)
# wadlist=(
#     #Priv
#     "${WAD_PATH}/rampagepriv-v6-1.pk3 \
#     ${WAD_PATH}/rampage-stats-fix.pk3 \
#     ${WAD_PATH}/ctfcap2d.pk3 \
#     ${WAD_PATH}/hudtimer_v4fix.pk3 \
#     ${WAD_PATH}/zandrospree2rc2.pk3 \
#     ${WAD_PATH}/odaflagx.pk3"
#     #Pub
#     "${WAD_PATH}/hudtimer_v4fix.pk3 \
#     ${WAD_PATH}/odaflagx.pk3 \
#     ${WAD_PATH}/zandrospree2rc2.pk3 \
#     ${WAD_PATH}/rampagepriv-v5-1.pk3 \
#     ${WAD_PATH}/rampagesuperpub-v3.pk3 \
#     ${WAD_PATH}/rampage-stats-fix.pk3"
#     #Duel
#     "${WAD_PATH}/duel40b.pk3 \
#     ${WAD_PATH}/zandrospree2rc2.pk3 \
#     ${WAD_PATH}/clearlights.wad"
#     #rduel
#     "${WAD_PATH}/duel40b.pk3 \
#     ${WAD_PATH}/zandrospree2rc2.pk3 \
#     ${WAD_PATH}/clearlights.wad"
#     #HNS
#     "${WAD_PATH}/skulltag_content-3.0-beta01.pk3 \
#     ${WAD_PATH}/stlmshnsv4.wad \
#     ${WAD_PATH}/hnsv1.0.2.pk3"
#     #Veng
#     "${WAD_PATH}/rampagepriv-v6-1.pk3 \
#     ${WAD_PATH}/vengeancemaps_v1.06.pk3 \
#     ${WAD_PATH}/vengeanceweapons_v1.53.pk3 \
#     ${WAD_PATH}/rampage-stats-fix.pk3 \
#     ${WAD_PATH}/ctfcap2d.pk3 \
#     ${WAD_PATH}/hudtimer_v4fix.pk3 \
#     ${WAD_PATH}/zandrospree2rc2.pk3 \
#     ${WAD_PATH}/odaflagx.pk3"
#     #LGduel
#     "${WAD_PATH}/duel40b.pk3 \
#     ${WAD_PATH}/lgmod.pk3 \
#     ${WAD_PATH}/zandrospree2rc2.pk3 \
#     ${WAD_PATH}/clearlights.wad"
# )

# veng_wadlist=(
#     "${WAD_PATH}/rampagepriv-v6-1.pk3 \
#     ${WAD_PATH}/vengeancemaps_v1.06.pk3 \
#     ${WAD_PATH}/vengeanceweapons_v1.53.pk3 \
#     ${WAD_PATH}/rampage-stats-fix.pk3 \
#     ${WAD_PATH}/ctfcap2d.pk3 \
#     ${WAD_PATH}/hudtimer_v4fix.pk3 \
#     ${WAD_PATH}/zandrospree2rc2.pk3 \
#     ${WAD_PATH}/odaflagx.pk3"
#     "${WAD_PATH}/rampagepriv-v6-1.pk3 \
#     ${WAD_PATH}/vengeancemaps_v1.06.pk3 \
#     ${WAD_PATH}/vengeanceweapons_v1.53.pk3 \
#     ${WAD_PATH}/rampage-stats-fix.pk3 \
#     ${WAD_PATH}/rampage_lockers.pk3 \
#     ${WAD_PATH}/ctfcap2d.pk3 \
#     ${WAD_PATH}/hudtimer_v4fix.pk3 \
#     ${WAD_PATH}/zandrospree2rc2.pk3 \
#     ${WAD_PATH}/odaflagx.pk3"
# )
