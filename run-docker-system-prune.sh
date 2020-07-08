#!/bin/sh
docker run --rm \
-v /var/run/docker.sock:/var/run/docker.sock \
docker:18.09 \
docker system prune --force
