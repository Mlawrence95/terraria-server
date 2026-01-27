# Load constants
source ~/terraria/terraria-server/scripts/shared_variables.sh

set -ex

start_server_in_background() {
  echo "Starting Terraria server in a screen session..."

  # Create a new screen session and run the Terraria server
  screen -dmS terraria-server "$SERVER_BINARY_PATH" -config serverconfig.txt

  echo "Server started in screen session 'terraria-server'."
  echo "To reattach to the screen session, run: screen -r terraria-server"
}

echo "Inserting world path into server config file..."
echo "world=${WORLD_FILE_PATH}" >> ${SERVER_CONFIG_PATH}
echo "Moving version-controlled server config to the binary path..."
cp ${SERVER_CONFIG_PATH} ${EXE_ROOT}

start_server_in_background
