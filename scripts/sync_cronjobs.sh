#!/bin/bash
set +ex
# Load constants
source "${HOME}/terraria/terraria-server/scripts/shared_variables.sh"

if [ ! -f "${CRONTAB_CONFIG_PATH}" ]; then
  echo "Error: ${CRONTAB_CONFIG_PATH} does not exist!"
  exit 1
fi

echo "Setting crontab..."
chmod +x ${WORKSPACE_ROOT}/scripts/*.sh
crontab ${CRONTAB_CONFIG_PATH} || { echo "Failed to set crontab! Exiting."; exit 1; }

echo "New cron config is $(crontab -l)"
