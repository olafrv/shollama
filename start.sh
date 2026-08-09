#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <cli|ui|alexis>"
  exit 1
fi

# Detect GPU availability
# https://docs.docker.com/compose/how-tos/gpu-support/
COMPOSE_FILE="docker-compose.yaml"
if command -v nvidia-smi &> /dev/null; then
  echo "GPU detected - enabling GPU support"
  COMPOSE_FILE=$(mktemp --suffix=.json)
  trap 'rm -f "$COMPOSE_FILE"' EXIT
  docker compose -f docker-compose.yaml --profile "$1" config --format json \
    | jq '.services.ollama.deploy.resources.reservations.devices = [{"driver": "nvidia", "count": "all", "capabilities": ["gpu"]}]' \
    > "$COMPOSE_FILE"
else
  echo "No GPU detected - running CPU-only"
fi

# Ensure the 'containers' network exists
if docker network inspect containers &> /dev/null; then
  echo "Docker network 'containers' already exists"
else
  echo "Creating Docker network 'containers'"
  docker network create containers
fi

docker compose -f "$COMPOSE_FILE" --profile "$1" pull --ignore-buildable
docker compose -f "$COMPOSE_FILE" --profile "$1" up -d --build
