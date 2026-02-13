#!/bin/bash
set +ex
# Load constants
source "${HOME}/terraria/terraria-server/scripts/shared_variables.sh"

if [ ! -f "${CRONTAB_CONFIG_PATH}" ]; then
  echo "Error: ${CRONTAB_CONFIG_PATH} does not exist!"
  exit 1
fi

# Set system time to Pacific time.
# Double check by calling $ timedatectl
sudo timedatectl set-timezone America/Los_Angeles

echo "Setting crontab..."
chmod +x ${WORKSPACE_ROOT}/*.sh
chmod +x ${WORKSPACE_ROOT}/scripts/*.sh
chmod +x ${WORKSPACE_ROOT}/scripts/chores/*.sh
crontab ${CRONTAB_CONFIG_PATH} || { echo "Failed to set crontab! Exiting."; exit 1; }
sudo systemctl restart cron
echo "New cron config is $(crontab -l)"
