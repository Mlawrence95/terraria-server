source ~/terraria/terraria-server/scripts/shared_variables.sh

# Provides private API key through the webhook url.
source ${WORKSPACE_ROOT}/.env

function send_discord_message {
    MESSAGE=$1
    curl -H "Content-Type: application/json" \
            -X POST \
            -d "{\"content\": \"$MESSAGE\"}" \
            ${DISCORD_WEBHOOK}
}
