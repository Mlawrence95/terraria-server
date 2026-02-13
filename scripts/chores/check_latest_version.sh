#!/bin/bash

set -e

# Load constants
source "${HOME}/terraria/terraria-server/scripts/shared_variables.sh"
source "${WORKSPACE_ROOT}/scripts/ping_discord.sh"
source "${WORKSPACE_ROOT}/scripts/server_admin.sh"



function extract_latest_version {
    # Fetch the page source containing the changenotes table
    PAGE_SOURCE=$(curl -s "https://terraria.wiki.gg/wiki/Desktop_version_history")

    # Extract the first version number found in an ID tag (e.g., id="1.4.5.2")
    # This looks for the pattern: id="X.X.X.X"
    VERSION_DOTS=$(echo "$PAGE_SOURCE" | grep -oP 'id="\K\d+(\.\d+)+' | head -1)

    if [ -z "$VERSION_DOTS" ]; then
        echo "Could not find a version number in the HTML."
        exit 1
    fi

    # Strip the dots to match the API format (1.4.5.2 -> 1452)
    VERSION_CLEAN=$(echo "${VERSION_DOTS}" | tr -d '.')
    echo "${VERSION_CLEAN}"
}

function set_version_in_constants_file {
    DESIRED_VERSION=$1
    CONSTANTS_FILE_PATH="${WORKSPACE_ROOT}/scripts/shared_variables.sh"

    echo "Updating constants file:"
    echo " - VERSION_SHORTNAME → ${DESIRED_VERSION}"

    # Replace VERSION_SHORTNAME line
    sed -i "s/^export VERSION_SHORTNAME=.*/export VERSION_SHORTNAME=${DESIRED_VERSION}/" "${CONSTANTS_FILE_PATH}"
    # Re-source the file so vars update across the board
    source "${CONSTANTS_FILE_PATH}"

    echo "Constants file updated successfully."
}

function maybe_upgrade_server_version {
    INFERRED_VERSION=$(extract_latest_version)
    echo "Found Version: ${INFERRED_VERSION} on Wiki. We are pinned to version ${VERSION_SHORTNAME}."

    if [ "${INFERRED_VERSION}" !=  "${VERSION_SHORTNAME}" ]; then
        send_discord_message "🌲 Found new Terraria server version. Please rollout ASAP @everyone. Attemping automated rollout first..."
        set_version_in_constants_file ${INFERRED_VERSION}
        ${WORKSPACE_ROOT}/update_server_version.sh
        restart_server_with_global_message_warning
        send_discord_message "[Experimental] Auto version update likely succeeded. Please manually verify."
    else
        echo "🌲 Versions are up to date."
    fi
}

maybe_upgrade_server_version
