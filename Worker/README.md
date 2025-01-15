# Blender
## Locations
### Blender Plugin Location
```$blender_plugin_location```: ```/usr/share/blender/scripts/addons```
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
Not case sensitive.
- ```MANAGER_URL```: URL of the Flamenco Manager.
    Controles the ```-manager``` argument, ignored if not specified. ```STRING```
- ```REGISTER```: (Re-)Register at the main manager, ignored if not specified. Aquivalent to ```register```. ```BOOL```
- ```LOG_LEVEL```: Controlles the log level. Defaults to ```normal```. ```STRING```
    1. ```trace```: Enable trace-level logging. Aquivalent to ```-trace```.
    2. ```debug```: Enables debug-level logging. Aquivalent to ```-debug```.
    3. ```default``` or ```normal```: Normal logging level. (Default)
    4. ```quiet```: Only log warning-level and worse. Aquivalent to ```-quiet```.
- ```RESTART_EXIT_CODE```: Mark this Worker as restartable. It will exit with this code to signify it needs to be restarted. Aquivalent to ```-restart-exit-code```. ```INT```
- ```CUSTOM```: Allows you to input any command line arguments as one continuous string. Interpreted at shell as bash. ```STRING```
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