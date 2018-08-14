
# This file is deliberately set as non-executable (i.e. shebang line is missing)

source ${SCRIPT_DIR}/scripts/setyenv.sh
source ${HYBRIS_RUNTIME_PROPERTIES}

export DB_USERNAME DB_PASSWORD DB_ROOTPASS
DOCKER_COMPOSE_DIR=${COMMON_FOLDER}/docker-compose
echo "Docker Compose files directory: ${DOCKER_COMPOSE_DIR}"
echo "##################"
