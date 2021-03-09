#!/bin/bash

export CADDY_CONTAINER=$(docker ps -a -q --filter="name=caddy")
export CADDY_PID=$(docker exec -it $CADDY_CONTAINER pgrep caddy)
CADDY_PID=${CADDY_PID//[$'\t\r\n ']}
echo "Reloading config in $CADDY_CONTAINER at PID $CADDY_PID..."
docker exec -it $CADDY_CONTAINER caddy reload --config /etc/caddy/Caddyfile
echo "Reload signal complete..."
