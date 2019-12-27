#!/bin/bash
set -e

SERVER="$HOME/hlserver"

cd $SERVER

if [ ! -f update_csgo.cfg ]; then
    cat << EOF > update_csgo.cfg
login anonymous
force_install_dir ./csgo
app_update 740 validate
quit
EOF
fi

if [ ! -f csgo/csgo/cfg/autoexec.cfg ]; then
    cat << EOF > csgo/csgo/cfg/autoexec.cfg
log on //This is set to turn on logging! Don't put this in your server.cfg
hostname "Counter-Strike: Global Offensive Dedicated Server"
//rcon_password "yourrconpassword"
sv_password "" //Only set this if you intend to have a private server!
sv_cheats 0 //This should always be set, so you know it's not on
sv_lan 0 //This should always be set, so you know it's not on
EOF
fi

if [ ! -f csgo/csgo/cfg/server.cfg ]; then
    cat << EOF > csgo/csgo/cfg/server.cfg
sv_maxrate 0
sv_minrate 30000
sv_maxcmdrate 128
sv_mincmdrate 128
EOF
fi

./steamcmd.sh +runscript update_csgo.cfg
cd csgo
exec ./srcds_run -game csgo -tickrate 128 -autoupdate -steam_dir $SERVER -steamcmd_script $SERVER/update_csgo.cfg $@
