# Realistically, copy and paste this into your command line

# Basic dependencies
DEPENDENCIES=(wget tmux unzip git)
sudo apt update && sudo apt install -y "${DEPENDENCIES[@]}"

# Set up path for terraria files (doesnt have to be here tho)
# SERVER_ROOT=/home/${USER}/terraria
SERVER_ROOT=~/terraria
mkdir -p $SERVER_ROOT && cd $SERVER_ROOT

# Get initial install. Use `git pull origin main` to sync
git clone https://github.com/Mlawrence95/terraria-server.git

# See all github files
cd terraria-server
