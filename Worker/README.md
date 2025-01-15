# Enviroment Variables
## Flamenco Worker
### Official
- ```FLAMENCO_HOME```: Directory for Worker local files
    - ```flamenco-worker-credentials.yaml``` (worker identification)
    - ```flamenco-worker.sqlite``` (database update queue)
    - Default: ```$HOME/.local/share/flamenco```
- ```FLAMENCO_WORKER_NAME```: The name of the Worker. 
    - Default: hostname
### Custom
- ```MANAGER_URL```: URL of the Flamenco Manager.
    Controles the ```-manager``` argument, ignored if not specified.
# Configuration
## Command Line Arguments
- ```-debug```
        Enable debug-level logging.
- ```-find-manager```
        Autodiscover a Manager, then quit.
- ```-flush```
        Flush any buffered task updates to the Manager, then exits.
- ```-manager``` ```string```
        URL of the Flamenco Manager.
- ```-quiet```
        Only log warning-level and worse.
- ```-register```
        (Re-)register at the Manager.
- ```-restart-exit-code``` ```int```
        Mark this Worker as restartable. It will exit with this code to signify it needs to be restarted.
- ```-trace```
        Enable trace-level logging.
- ```-version```
        Shows the application version, then exits.
### Default Configuraton
- ```-find-manager``` ```$MANAGER_URL```
## Main Configuration File 
The Main Configuration File is popably configured by the server.
# Sources
- https://flamenco.blender.org/usage/worker-configuration/