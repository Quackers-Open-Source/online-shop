#!/usr/bin/env bash

# Meta
THIS_PATH=`readlink -f "${BASH_SOURCE[0]}" 2>/dev/null || echo $0`
SCRIPT_DIR=`dirname "${THIS_PATH}"`

source ${SCRIPT_DIR}/scripts/meta.sh


# Start Docker Compose Services (DB etc.)
cd ${DOCKER_COMPOSE_DIR}
docker-compose -p quackers up -d

sleep 3


# Setup & start Hybris Server
FLAG=$1$1

if [ "${FLAG}" = "" ] ; then
	FLAG="start"
fi

case $FLAG in
  "debug" | "-d" )
    CMD="./hybrisserver.sh debug"
  ;;

  * )
    CMD="./hybrisserver.sh ${FLAG}"
  ;;
esac

echo "##################"
echo "Please follow current startup log using: tail -f -n 1000 ${HYBRIS_LOG_DIR}/tomcat/console-$(date '+%Y%m%d').log"
echo "##################"

cd ${HYBRIS_BIN_DIR}/platform
exec ${CMD}

cd ${COMMON_FOLDER}
echo "##################"
echo "Startup sequence finalized!"
echo "##################"
