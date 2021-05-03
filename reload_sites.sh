#!/bin/bash

docker exec -it caddy2 caddy reload --config /etc/caddy/Caddyfile --adapter caddyfile
