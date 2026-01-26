# Fetches and unpacks server binary. Adapted from
# https://terraria.fandom.com/wiki/Server#How_to_(Linux)
# bash install_terraria_server_binary.sh

# Load constants
source ./shared_variables.sh

# Download and extract the server binary
wget ${SERVER_URL}
unzip terraria-server*

# Give executable permissions to the server files
cd ${VERSION_SHORTNAME}/Linux
chmod +x TerrariaServer.bin.x86*

# Create path for world files
mkdir -p ${WORLD_SAVES_PATH}
