# Don't allow any references to unset vars.
set -u

export WORKSPACE_ROOT="${HOME}/terraria/terraria-server"
cd "${WORKSPACE_ROOT}" || exit
echo "Resolved workspace root path to ${WORKSPACE_ROOT}"

# Binary info
# Pick one from https://terraria.wiki.gg/wiki/Server#Server_files
export VERSION_SHORTNAME=1455
export SERVER_URL="https://terraria.org/api/download/pc-dedicated-server/terraria-server-${VERSION_SHORTNAME}.zip"
export EXE_ROOT="${WORKSPACE_ROOT}/${VERSION_SHORTNAME}/Linux/"
export SERVER_BINARY_PATH="${EXE_ROOT}/TerrariaServer.bin.x86_64"

# File paths
export SERVER_CONFIG_PATH="${WORKSPACE_ROOT}/game_logic/serverconfig.txt"
export WORLD_SAVES_PATH="${WORKSPACE_ROOT}/worlds"
export WORLD_FILE_PATH="${WORLD_SAVES_PATH}/main_world_file.wld"
export BACKUPS_PATH="${HOME}/backups/"
export LOG_FILE_PATH="${WORKSPACE_ROOT}/server_logs.txt"
export CRONTAB_CONFIG_PATH="${WORKSPACE_ROOT}/scripts/cronjobs"

# Background process session management
export SCREEN_SESSION_NAME=terraria-server

echo "Targeting binary at ${SERVER_BINARY_PATH}"
