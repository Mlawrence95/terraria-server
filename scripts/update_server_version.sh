# There IS server downtime. Save everything.
# Set new version and server files in the constants file

set -ex

# Load constants
source ~/terraria/terraria-server/scripts/shared_variables.sh

# Backup world, remove old server files, then install new ones
bash ${WORKSPACE_ROOT}/scripts/run_backup.sh
rm -rf ${WORKSPACE_ROOT}/terraria-server-*.zip
# TODO: delete old server files (1450, etc)
bash ${WORKSPACE_ROOT}/scripts/install_terraria_server_binary.sh

# From here, run_server.sh
