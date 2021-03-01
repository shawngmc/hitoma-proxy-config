#!/bin/bash

TSTAMP=$(date +%s)

# Build image
docker build . -t hitoma-caddy:latest -t hitoma-caddy:$TSTAMP

