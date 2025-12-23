#!/bin/bash
set -ex
if [ -z "$1" ]; then
  echo "Usage: $0 --profile <cli|ui|alexis>"
  exit 1
fi
docker compose pull --ignore-buildable
docker compose --profile $1 up -d --build