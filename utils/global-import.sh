# source $SRCDIR/menus/Server-Menu-Screen.sh
# source $SRCDIR/menus/Server-Menu-Window.sh
# source $SRCDIR/Server-Menu-Window.sh
# source $SRCDIR/Server-AutoStart.sh
#utils

declare MENUDIR="$SRCDIR/menus"
declare DEFDIR="$SRCDIR/utils/definitions"
declare FUNCDIR="$SRCDIR/utils/functions"
declare HANDIR="$SRCDIR/utils/handlers"
declare HELPDIR="$SRCDIR/utils/helpers"

#misc
declare LOGDIR="$SRCDIR/logs"
declare TEMPDIR="$SRCDIR/temp"

source $MENUDIR/main.sh
source $MENUDIR/screens.sh

source $DEFDIR/configs.sh
source $DEFDIR/files.sh
source $DEFDIR/menus.sh
source $DEFDIR/screens.sh
source $DEFDIR/servers.sh
source $DEFDIR/windows.sh

source $HELPDIR/menuformat.sh
source $HELPDIR/stringformat.sh

source $HANDIR/init.sh
source $HANDIR/boot-start.sh
source $HANDIR/hourly-check.sh
source $HANDIR/screens.sh

source $FUNCDIR/windows.sh
source $FUNCDIR/screens.sh
source $FUNCDIR/servers/start.sh
#source $FUNCDIR/servers/stop.sh
source $FUNCDIR/servers/reset.sh
source $FUNCDIR/servers/check.sh