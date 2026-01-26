# Load constants
source ~/terraria/terraria-server/scripts/shared_variables.sh

set -ex

start_server_in_background() {
  # Check if a tmux session is already running
  if tmux has-session -t "$TMUX_SESSION_NAME" 2>/dev/null; then
    echo "tmux session '$TMUX_SESSION_NAME' is already running!"
  else
    echo "Starting Terraria server in tmux session..."

    # Start the tmux session with the server command
    tmux new-session -d -s "$TMUX_SESSION_NAME" bash -c "
      source ~/terraria/terraria-server/scripts/shared_variables.sh;
      STATIC_FLAGS='-config ${SERVER_CONFIG_PATH}';
      echo 'Starting Terraria server with flags: $STATIC_FLAGS';
      \"$SERVER_BINARY_PATH\" $STATIC_FLAGS;
      bash"  # Keep tmux session open for further commands after server exits

    echo "Server started in tmux session '$TMUX_SESSION_NAME'."
    echo "To detach from tmux, press <Ctrl+b> then d."
    echo "To reattach to the tmux session, run: tmux attach -t $TMUX_SESSION_NAME"
  fi
}



start_server_in_background
