#!/bin/bash
set -e
if [ -z "$1" ]; then
  echo "Usage: $0 <cli|ui|alexis>"
  exit 1
fi
docker compose --profile $1 down
