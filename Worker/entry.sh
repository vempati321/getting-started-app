#!/bin/bash
args=()
#test if MANAGER_URL env exists and add it to the arguments to specify a manager
if [ -n "$MANAGER_URL" ]; then #-n checks if lenght is not 0
    args+=("-manager=$MANAGER_URL")
fi

if [ -n "$REGISTER" ] && [ "${REGISTER,,}" = "true" ]; then
    args+=("-register")
fi

if [ -n "$LOG_LEVEL" ]; then
    if [ "${REGISTER,,}" = "normal" ] || [ "${REGISTER,,}" = "default" ]; then
        : #null command
    elif [ "${REGISTER,,}" = "trace" ]; then
        args+=("-trace")
    elif [ "${REGISTER,,}" = "debug" ]; then
        args+=("-debug")
    elif [ "${REGISTER,,}" = "quiet" ]; then
        args+=("-quiet")
    fi
fi

if [ -n "$RESTART_EXIT_CODE" ]; then
    args+=("-restart-exit-code=$RESTART_EXIT_CODE")
fi

if [ -n "$CUSTOM" ]; then
    args+=("$CUSTOM")
fi

echo "${args[@]}" #debug arguments

flamenco-worker "${args[@]}"  #launch flamenco-worker with args specified in args[]