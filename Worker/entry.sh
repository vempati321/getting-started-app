args=()
#test if MANAGER_URL env exists and add it to the arguments to specify a manager
if [ -z "$MANAGER_URL"]; then #-z checks if lenght is 0
args+=('-manager $MANAGER_URL')
fi

flamenco-worker -h