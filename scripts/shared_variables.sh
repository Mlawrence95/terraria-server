WORKSPACE_ROOT=$(realpath ~/terraria/terraria-server)

# Pick one from https://terraria.wiki.gg/wiki/Server#Server_files
SERVER_URL=https://terraria.org/api/download/pc-dedicated-server/terraria-server-1449.zip
VERSION_SHORTNAME=1449

SERVER_BINARY_PATH=${WORKSPACE_ROOT}/${VERSION_SHORTNAME}/Linux/TerrariaServer.bin.x86_64

TMUX_SESSION_NAME="terraria-server-session"

SERVER_CONFIG_PATH=${WORKSPACE_ROOT}/game_logic/serverconfig.txt
WORLD_SAVES_PATH=~/terraria/worlds/

echo "Loaded constants from shared variables file!"
