# Load constants
source ~/terraria/terraria-server/scripts/shared_variables.sh

set -ex

is_server_running() {
  screen -list | grep "terraria"
}


start_server_in_background() {
  
  if is_server_running; then
    echo "Terraria server is already running. No-op."
    echo "Attach with: screen -r terraria-server"
    return 0
  fi
  echo "Starting Terraria server in a screen session..."

  # Create a new screen session and run the Terraria server
  screen -dmS terraria-server "$SERVER_BINARY_PATH" -config serverconfig.txt

  echo "Server started in screen session 'terraria-server'."
  echo "To reattach to the screen session, run: screen -r terraria-server"
  echo "To leave session, use Ctrl + a  then  d"
  echo "use screen -ls to view sessions"
}


start_server_in_background
