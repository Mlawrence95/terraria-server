WORKSPACE_ROOT=$(realpath ~/terraria/terraria-server)

echo "Resolved workspace root path to ${WORKSPACE_ROOT}"
# Pick one from https://terraria.wiki.gg/wiki/Server#Server_files
SERVER_URL=https://terraria.org/api/download/pc-dedicated-server/terraria-server-1449.zip
VERSION_SHORTNAME=1449

EXE_ROOT=${WORKSPACE_ROOT}/${VERSION_SHORTNAME}/Linux/
SERVER_BINARY_PATH=${EXE_ROOT}/TerrariaServer.bin.x86_64

TMUX_SESSION_NAME="terraria-server-session"

SERVER_CONFIG_PATH=${WORKSPACE_ROOT}/game_logic/serverconfig.txt
WORLD_SAVES_PATH=${WORKSPACE_ROOT}/worlds
WORLD_FILE_PATH=${WORLD_SAVES_PATH}/main_world_file.wld
BACKUPS_PATH=~/backups/

echo "Loaded constants from shared variables file!"
