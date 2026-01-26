# Fetches and unpacks server binary. Adapted from
# https://terraria.fandom.com/wiki/Server#How_to_(Linux)
# bash install_terraria_server_binary.sh

update_worldpath_in_config() {
  local config_file="$1"  # Path to the config file
  local new_worldpath="$2"  # The new worldpath to set

  # Check if the worldpath is already replaced
  if grep -q "^worldpath=" "$config_file"; then
    echo "worldpath is already set in the config, skipping replacement."
  else
    # Check if the line with #worldpath exists
    if grep -q "^#worldpath=" "$config_file"; then
      echo "Updating worldpath in config to $new_worldpath..."
      # Replace #worldpath=... with the new worldpath
      sed -i "s|^#worldpath=.*|worldpath=$new_worldpath|" "$config_file"
    else
      echo "No worldpath line found, adding new worldpath."
      # If no #worldpath is found, append the new worldpath at the end of the file
      echo "worldpath=$new_worldpath" >> "$config_file"
    fi
  fi
}


# Load constants
source ~/terraria/terraria-server/scripts/shared_variables.sh

# Download and extract the server binary
wget ${SERVER_URL}
unzip terraria-server*

# Give executable permissions to the server files
cd ${VERSION_SHORTNAME}/Linux
chmod +x TerrariaServer.bin.x86*

# Create path for world files
mkdir -p ${WORLD_SAVES_PATH}
update_worldpath_in_config "${SERVER_CONFIG_PATH}" "${WORLD_SAVES_PATH}"

# Create separate backups path
mkdir -p ${BACKUPS_PATH}
