#!/bin/bash

# Load constants
source "${HOME}/terraria/terraria-server/scripts/shared_variables.sh"

# Baseline admin function: send command to background process
send_command_to_terraria_server() {
    local COMMAND="$1"
    
    # Check if session exists first to avoid errors
    if screen -list | grep -q "${SCREEN_SESSION_NAME}"; then
        # 'stuff' sends the text, $'\n' simulates the Enter key
        screen -S "${SCREEN_SESSION_NAME}" -p 0 -X stuff "${COMMAND}"$'\n'
    else
        echo "Error: Screen session '${SCREEN_SESSION_NAME}' not found."
        return 1
    fi
}

# Helper Functions
save_server() {
    echo "Saving world..."
    send_command_to_terraria_server "save"
}

exit_server() {
    echo "Saving and shutting down..."
    send_command_to_terraria_server "exit"
}

send_global_message() {
    local MSG="$1"
    echo "Sending message: $MSG"
    send_command_to_terraria_server "say ${MSG}"
}

set_time_to_day() {
    echo "Setting time to day..."
    send_command_to_terraria_server "dawn"
}

get_online_players() {
    echo "Getting online players..."
    send_command_to_terraria_server "playing"
    sleep 1
    tail -n 2 "${LOG_FILE_PATH}"
}

start_server() {
    bash "${WORKSPACE_ROOT}/scripts/run_server.sh"
}

restart_server_gracefully() {
    send_global_message "Server is restarting. See you in a minute!"
    exit_server

    echo "Waiting for process to terminate..."
    while screen -list | grep "${SCREEN_SESSION_NAME}"; do
        echo "Waiting..."
        sleep 2
    done

    echo "Restarting server..."
    start_server
}

restart_server_with_global_message_warning() {
    echo "Starting graceful restart sequence..."

    send_global_message "Server restart in 60 seconds. Please finish your tasks!"
    sleep 30
    
    send_global_message "Server restart in 30 seconds."
    sleep 20

    send_global_message "Server restarting in 10 seconds!"
    sleep 10
    restart_server_gracefully
}
