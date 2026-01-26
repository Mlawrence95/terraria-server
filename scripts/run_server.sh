# Load constants
source ~/terraria/terraria-server/scripts/shared_variables.sh

run_terraria_server_with_flags() {
  STATIC_FLAGS="-config ${SERVER_CONFIG_PATH} -world ${WORLD_SAVES_PATH}"
  # Run the server binary with the static flags
  "$SERVER_BINARY_PATH" $STATIC_FLAGS
}


# Function to create tmux session and start the server
start_server_in_background() {
  # Check if a tmux session is already running
  if tmux has-session -t $TMUX_SESSION_NAME 2>/dev/null; then
    echo "tmux session '$TMUX_SESSION_NAME' is already running!"
  else
    echo "Starting Terraria server in tmux session..."
    tmux new-session -d -s "$TMUX_SESSION_NAME" "$(declare -f run_terraria_server_with_flags); run_terraria_server_with_flags"

    echo "Server started in tmux session '$TMUX_SESSION_NAME'."
    echo "To detach from tmux, press <Ctrl+b> then d."
    echo "To reattach to the tmux session, run: tmux attach -t $TMUX_SESSION_NAME"
  fi
}
