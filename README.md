# Hosting a Terraria Server on the Cloud

## Basic flow:

* Follow steps in working_log.md to set up GCP project
* SSH into Compute Engine instance
* run `initial_installation.sh` to setup foundational dependencies. you should just copy and paste this into the terminal on the cloud machine
* now you can get the terraria files running, `flash_server.sh`

## Server updates

Follow logic in `scripts/update_server_version.sh` and restart server. Always gracefully exit the server first.

## World files

These live in the location specified in the `scripts/shared_variables.sh` file:

```
WORLD_SAVES_PATH=${WORKSPACE_ROOT}/worlds
WORLD_FILE_PATH=${WORLD_SAVES_PATH}/main_world_file.wld
```

By default, these are auto-created using the parameters in `game_logic/serverconfig.txt`.

## Sources

* https://terraria.fandom.com/wiki/Server
* https://docs.google.com/document/d/1KZofwemfcQQCOVlWw4VxOn8MArTOauFWC5EVQvsF_Aw/edit?tab=t.0
* https://terraria.fandom.com/wiki/Guide:Setting_up_a_Terraria_server
* https://terraria.wiki.gg/wiki/Server#Server_files
* https://terraria.wiki.gg/wiki/Server#List_of_console_commands
* https://terraria.wiki.gg/wiki/Server#Command-line_parameters
* https://terraria.fandom.com/wiki/Server#Downloads
