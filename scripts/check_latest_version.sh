#!/bin/bash

set -ex

# Load constants
source ~/terraria/terraria-server/scripts/shared_variables.sh

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


echo "Found Version: ${VERSION_CLEAN} on Wiki. We are pinned to version ${VERSION_SHORTNAME}."
