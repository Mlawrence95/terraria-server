echo "Starting full flash of bare server."
set -ex

# Load constants
source ~/terraria/terraria-server/scripts/shared_variables.sh

# If worlds path already exists, make a backup just in case
if [ -e "${WORLD_SAVES_PATH}" ]; then
    echo "Making a backup out of caution"
    ./scripts/run_backup.sh
fi

echo "Installing dependencies..."
${WORKSPACE_ROOT}/initial_installation.sh
echo "Getting terraria server files and formatting them"
${WORKSPACE_ROOT}/scripts/install_terraria_server_binary.sh
echo "Attempting to start server..."
${WORKSPACE_ROOT}/scripts/run_server.sh
