#!/bin/bash

# This will remove all dangling images.
docker image prune -f

# docker container prune --filter "until=168h"

# This will remove all volumes not used by at least one container.
docker volume prune -f

# This will remove all networks not used by at least one container.
docker network prune -f

# This will remove all dangling build cache.
docker builder prune -f
