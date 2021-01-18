#!/bin/bash

export CADDY_CONTAINER=$(docker ps -a -q --filter="name=caddy")
export CADDY_PID=$(docker exec -it $CADDY_CONTAINER pgrep caddy)
CADDY_PID=${CADDY_PID//[$'\t\r\n ']}
export KILL_COMMAND="kill -SIGUSR1 $CADDY_PID"
echo "Reloading config in $CADDY_CONTAINER at PID $CADDY_PID..."
echo "Using command: $KILL_COMMAND"
docker exec -it $CADDY_CONTAINER $KILL_COMMAND
echo "Reload signal complete..."
