#!/usr/bin/env bash

# Meta
THIS_PATH=`readlink -f "${BASH_SOURCE[0]}" 2>/dev/null || echo $0`
SCRIPT_DIR=`dirname "${THIS_PATH}"`

source ${SCRIPT_DIR}/scripts/meta.sh


# Stop Hybris Server & Docker Compose Services
cd ${HYBRIS_BIN_DIR}/platform
./hybrisserver.sh stop

cd ${DOCKER_COMPOSE_DIR}
docker-compose -p quackers stop

cd ${COMMON_FOLDER}
echo "##################"
echo "Shutdown sequence finalized!"
echo "##################"
