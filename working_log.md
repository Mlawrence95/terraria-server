# Working log

## 1/25/2026

New Terraria version coming in 2 days. Will likely come with a new server version to install. This means any progress on setting up a server needs to be reusable.


### Requirements

* Basic flow: create GCP compute engine instance, make SSH flow to it
* Create scripts for the following tasks (may be one or many):
  * Fetch terraria server binary (Something like "https://terraria.org/api/download/pc-dedicated-server/terraria-server-1449.zip")
  * Fetch server configuration from github
  * Startup server in persistent background process (should last beyond SSH session)
    * Save files should be on persistent disk!
    * [Optional] Backup server save files somewhere
  * [Optional] Graceful exit script. Trigger save and then tear down server

### Testing:

* Make clean install on fresh compute engine instance
* Join from Terraria character on steam
* Check world difficulty, password on entrace, etc
* Inspect files on disk. Is config and checkpoint there?
* Turn off instance and back on, restart server. Is the world state correct?

### Execution

* Made Google Cloud project here to host the VM: https://console.cloud.google.com/welcome?project=terraria-server-485500
  * Set up billing
  * Set billing alert for this project. If costs approach $30 per month, email me
  * "Enable" Compute Engine API from its product page
  * Create new Compute Engine instance. E2-medium in a data center near my friends and I (US West).
  * Created static external IP address to make connecting easy
  
![](./docs/cloud_console.png)

![](./docs/static_ip.png)

* Begin test server set up (can click into SSH in browser from Cloud console)
* open github repo to public at https://github.com/Mlawrence95/terraria-server.git
* Created `initial_installation.sh` to pull in github files
* Created `scripts/install_terraria_server_binary.sh` for loading and formatting server binaries
* Created `scripts/shared_variables.sh` to keep constants in sync across files
