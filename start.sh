#!/bin/bash
set -ex

if [ -z "$1" ]; then
  echo "Usage: $0 <cli|ui|alexis>"
  exit 1
fi

# Detect GPU availability
GPU_COMPOSE_FILE=""
if command -v nvidia-smi &> /dev/null; then
  echo "GPU detected - enabling GPU support"
  GPU_COMPOSE_FILE="-f docker-compose.yaml -f docker-compose.gpu.yaml"
else
  echo "No GPU detected - running CPU-only"
  GPU_COMPOSE_FILE="-f docker-compose.yaml"
fi

# Ensure the 'containers' network exists
if docker network inspect containers &> /dev/null; then
  echo "Docker network 'containers' already exists"
else
  echo "Creating Docker network 'containers'"
  docker network create containers
fi

docker compose pull --ignore-buildable
docker compose $GPU_COMPOSE_FILE --profile "$1" up -d --build
