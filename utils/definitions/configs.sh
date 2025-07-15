declare -A SERV_CONFIG
SERV_CONFIG["EXTRA,ALLOWTEAMS"]="null"
SERV_CONFIG["EXTRA,FORCEGL"]="null"
SERV_CONFIG["EXTRA,FRIENDPASS"]="null"
SERV_CONFIG["EXTRA,STATS"]="null"
SERV_CONFIG["EXTRA,UNBLOCK"]="null"

SERV_CONFIG["MODE,DUEL"]="null"
SERV_CONFIG["MODE,DEATHMATCH"]="null"
SERV_CONFIG["MODE,CTF"]="null"
SERV_CONFIG["MODE,DUEL"]="null"
SERV_CONFIG["MODE,SURVIVAL"]="null"

SERV_CONFIG["PRESET,PRIV"]="null"
SERV_CONFIG["PRESET,PUB"]="null"
SERV_CONFIG["PRESET,DUEL"]="null"
SERV_CONFIG["PRESET,RDUEL"]="null"
SERV_CONFIG["PRESET,HNS"]="null"

SERV_CONFIG["NEW,HOSTNAME"]="null"
SERV_CONFIG["NEW,JOINPASSWORD"]="null"
SERV_CONFIG["NEW,ADMINPASSWORD"]="null"
SERV_CONFIG["NEW,COMPATFLAGS"]="null"
SERV_CONFIG["NEW,PORT"]="null"
SERV_CONFIG["NEW,CUSTOMFLAGS"]="null"
SERV_CONFIG["NEW,DMFLAGS"]="null"
SERV_CONFIG["NEW,DMFLAGS2"]="null"
SERV_CONFIG["NEW,ZADMFLAGS"]="null"
SERV_CONFIG["NEW,ZADMFLAGS2"]="null"
SERV_CONFIG["NEW,ZACOMPATFLAGS"]="null"
SERV_CONFIG["NEW,COMPATFLAGS2"]="null"

SERV_CONFIG["PORT,LASTUSED"]=0
SERV_CONFIG["PORT,NEXTAVAILABLE"]=0

VENG_SERVERS["WEEK,MAP"]="Week1,52|80"

rampage_servers=(
    'priv'
    'pub'
    'duel'
    'rduel'
    'hns'
    'veng'
    'lgduel'
)

vengeance_servers=(
    "prac-a"
    "prac-b"
    "game-a"
    "game-b"
)

veng_season=(
    'veng_week1'
    'veng_week2'
    'veng_week3'
    'veng_week4'
    'veng_semi'
    'veng_finals'
)

wadlist=(
    #Priv
    '/var/www/chaoscore/wads/rampagepriv-v6-1.pk3 /var/www/chaoscore/wads/rampage-stats-fix.pk3 /var/www/chaoscore/wads/ctfcap2d.pk3 /var/www/chaoscore/wads/hudtimer_v4fix.pk3 /var/www/chaoscore/wads/zandrospree2rc2.pk3 /var/www/chaoscore/wads/odaflagx.pk3'
    #Pub
    '/var/www/chaoscore/wads/hudtimer_v4fix.pk3 /var/www/chaoscore/wads/odaflagx.pk3 /var/www/chaoscore/wads/zandrospree2rc2.pk3 /var/www/chaoscore/wads/rampagepriv-v5-1.pk3 /var/www/chaoscore/wads/rampagesuperpub-v3.pk3 /var/www/chaoscore/wads/rampage-stats-fix.pk3'
    #Duel
    '/var/www/chaoscore/wads/duel40b.pk3 /var/www/chaoscore/wads/zandrospree2rc2.pk3 /var/www/chaoscore/wads/clearlights.wad'
    #rduel
    '/var/www/chaoscore/wads/duel40b.pk3 /var/www/chaoscore/wads/zandrospree2rc2.pk3 /var/www/chaoscore/wads/clearlights.wad'
    #HNS
    '/var/www/chaoscore/wads/skulltag_content-3.0-beta01.pk3 /var/www/chaoscore/wads/stlmshnsv4.wad /var/www/chaoscore/wads/hnsv1.0.2.pk3'
    #Veng
    '/var/www/chaoscore/wads/rampagepriv-v6-1.pk3 /var/www/chaoscore/wads/vengeancemaps_v1.06.pk3 /var/www/chaoscore/wads/vengeanceweapons_v1.53.pk3 /var/www/chaoscore/wads/rampage-stats-fix.pk3 /var/www/chaoscore/wads/ctfcap2d.pk3 /var/www/chaoscore/wads/hudtimer_v4fix.pk3 /var/www/chaoscore/wads/zandrospree2rc2.pk3 /var/www/chaoscore/wads/odaflagx.pk3'
    #LGduel
    '/var/www/chaoscore/wads/duel40b.pk3 /var/www/chaoscore/wads/lgmod.pk3 /var/www/chaoscore/wads/zandrospree2rc2.pk3 /var/www/chaoscore/wads/clearlights.wad'
)

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

hostnames=(
    '+sv_hostname ":: [NY] = [RAMPAGE] = [Priv CTF] ::"'
    '+sv_hostname ":: [NY] = [RAMPAGE] = [Public CTF] ::"'
    '+sv_hostname ":: [NY] = [RAMPAGE] = [Duel40] ::"'
    '+sv_hostname ":: [NY] = [RAMPAGE] = [Rivals Duel] ::"'
    '+sv_hostname ":: [NY] = [RAMPAGE] = [Hide n Seek] ::"'
    '+sv_hostname ":: [NY] = [RAMPAGE] = [Vengeance Priv] ::"'
    '+sv_hostname ":: [NY] = [RAMPAGE] = [LG Duel] ::"'
)

veng_season=(
    'week1'
    'week2'
    'week3'
    'week4'
    'semi'
    'finals'
)

veng_week1=(
    '+sv_hostname ":: [NY] = [RAMPAGE] = [VENGEANCE VI] - Week 1 - MAP52 | MAP 80 :: Practice A :: "'
    '+sv_hostname ":: [NY] = [RAMPAGE] = [VENGEANCE VI] - Week 1 - MAP52 | MAP 80 :: Practice B :: "'
    '+sv_hostname ":: [NY] = [RAMPAGE] = [VENGEANCE VI] - Week 1 - MAP52 | MAP 80 :: Game B :: "'
    '+sv_hostname ":: [NY] = [RAMPAGE] = [VENGEANCE VI] - Week 1 - MAP52 | MAP 80 :: Game B :: "'
)

veng_week2=(
    '+sv_hostname ":: [NY] = [RAMPAGE] = [VENGEANCE VI] - Week 2 - MAP52 | MAP 80 :: Practice A :: "'
    '+sv_hostname ":: [NY] = [RAMPAGE] = [VENGEANCE VI] - Week 2 - MAP52 | MAP 80 :: Practice B :: "'
    '+sv_hostname ":: [NY] = [RAMPAGE] = [VENGEANCE VI] - Week 2 - MAP52 | MAP 80 :: Game B :: "'
    '+sv_hostname ":: [NY] = [RAMPAGE] = [VENGEANCE VI] - Week 2 - MAP52 | MAP 80 :: Game B :: "'
)

veng_week3=(
    '+sv_hostname ":: [NY] = [RAMPAGE] = [VENGEANCE VI] - Week 2 - MAP52 | MAP 80 :: Practice A :: "'
    '+sv_hostname ":: [NY] = [RAMPAGE] = [VENGEANCE VI] - Week 2 - MAP52 | MAP 80 :: Practice B :: "'
    '+sv_hostname ":: [NY] = [RAMPAGE] = [VENGEANCE VI] - Week 2 - MAP52 | MAP 80 :: Game B :: "'
    '+sv_hostname ":: [NY] = [RAMPAGE] = [VENGEANCE VI] - Week 2 - MAP52 | MAP 80 :: Game B :: "'
)

veng_week4=(
    '+sv_hostname ":: [NY] = [RAMPAGE] = [VENGEANCE VI] - Week 2 - MAP52 | MAP 80 :: Practice A :: "'
    '+sv_hostname ":: [NY] = [RAMPAGE] = [VENGEANCE VI] - Week 2 - MAP52 | MAP 80 :: Practice B :: "'
    '+sv_hostname ":: [NY] = [RAMPAGE] = [VENGEANCE VI] - Week 2 - MAP52 | MAP 80 :: Game B :: "'
    '+sv_hostname ":: [NY] = [RAMPAGE] = [VENGEANCE VI] - Week 2 - MAP52 | MAP 80 :: Game B :: "'
)

veng_semi=(
    '+sv_hostname ":: [NY] = [RAMPAGE] = [VENGEANCE VI] - Week 2 - MAP52 | MAP 80 :: Practice A :: "'
    '+sv_hostname ":: [NY] = [RAMPAGE] = [VENGEANCE VI] - Week 2 - MAP52 | MAP 80 :: Practice B :: "'
    '+sv_hostname ":: [NY] = [RAMPAGE] = [VENGEANCE VI] - Week 2 - MAP52 | MAP 80 :: Game B :: "'
    '+sv_hostname ":: [NY] = [RAMPAGE] = [VENGEANCE VI] - Week 2 - MAP52 | MAP 80 :: Game B :: "'
)

veng_final=(
    '+sv_hostname ":: [NY] = [RAMPAGE] = [VENGEANCE VI] - Week 2 - MAP52 | MAP 80 :: Practice A :: "'
    '+sv_hostname ":: [NY] = [RAMPAGE] = [VENGEANCE VI] - Week 2 - MAP52 | MAP 80 :: Practice B :: "'
    '+sv_hostname ":: [NY] = [RAMPAGE] = [VENGEANCE VI] - Week 2 - MAP52 | MAP 80 :: Game B :: "'
    '+sv_hostname ":: [NY] = [RAMPAGE] = [VENGEANCE VI] - Week 2 - MAP52 | MAP 80 :: Game B :: "'
)

# hostnames2=(
#     '+sv_hostname ":: [NY] = [DOOMRAMPAGE.ORG] = [Priv CTF] ::"'
#     '+sv_hostname ":: [NY] = [DOOMRAMPAGE.ORG] = [Public CTF] ::"'
#     '+sv_hostname ":: [NY] = [DOOMRAMPAGE.ORG] =  [Duel40] ::"'
#     '+sv_hostname ":: [NY] = [DOOMRAMPAGE.ORG] = [Rivals Duel] ::"'
#     '+sv_hostname ":: [NY] = [DOOMRAMPAGE.ORG] = [Hide n Seek] ::"'
# )
