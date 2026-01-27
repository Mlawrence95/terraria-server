# Fetches and unpacks server binary. Adapted from
# https://terraria.fandom.com/wiki/Server#How_to_(Linux)
# bash install_terraria_server_binary.sh

# Load constants
source ~/terraria/terraria-server/scripts/shared_variables.sh

if [[ -x "$SERVER_BINARY_PATH" ]]; then
  echo "Terraria server binary already installed at:"
  echo "  $SERVER_BINARY_PATH"
  echo "No-op."
  exit 0
fi

# Download and extract the server binary
wget ${SERVER_URL}
unzip terraria-server*

# Give executable permissions to the server files
cd ${VERSION_SHORTNAME}/Linux
chmod +x TerrariaServer.bin.x86*

# Create path for world files, give read/write perms
mkdir -p ${WORLD_SAVES_PATH}
chmod -R u+rwX ${WORLD_SAVES_PATH}

# Create separate backups path
mkdir -p ${BACKUPS_PATH}
chmod -R u+rwX ${BACKUPS_PATH}

# Add local world dir to the server config, and copy it over to the final binary path.
if ! grep -q '^world=' "$SERVER_CONFIG_PATH"; then
  echo "Inserting world path into server config file..."
  echo "world=${WORLD_FILE_PATH}" >> "$SERVER_CONFIG_PATH"
fi

echo "Moving version-controlled server config to the binary path..."
cp ${SERVER_CONFIG_PATH} ${EXE_ROOT}
