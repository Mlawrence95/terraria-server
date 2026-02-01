export WORKSPACE_ROOT=$(realpath "${HOME}/terraria/terraria-server")
echo "Resolved workspace root path to ${WORKSPACE_ROOT}"

# Binary info
# Pick one from https://terraria.wiki.gg/wiki/Server#Server_files
export SERVER_URL"https://terraria.org/api/download/pc-dedicated-server/terraria-server-1453.zip"
export VERSION_SHORTNAME=1453
export EXE_ROOT="${WORKSPACE_ROOT}/${VERSION_SHORTNAME}/Linux/"
export SERVER_BINARY_PATH="${EXE_ROOT}/TerrariaServer.bin.x86_64"

# File paths
export SERVER_CONFIG_PATH="${WORKSPACE_ROOT}/game_logic/serverconfig.txt"
export WORLD_SAVES_PATH="${WORKSPACE_ROOT}/worlds"
export WORLD_FILE_PATH="${WORLD_SAVES_PATH}/main_world_file.wld"
export BACKUPS_PATH="${HOME}/backups/"
export LOG_FILE_PATH="${WORKSPACE_ROOT}/server_logs.txt"

# Background process session management
export SCREEN_SESSION_NAME=terraria-server
