#!/bin/bash

set -e

# Load admin scripts
source "${HOME}/terraria/terraria-server/scripts/server_admin.sh"

restart_server_with_global_message_warning
