#!/bin/bash
set -ex
docker compose pull --ignore-buildable
docker compose up -d --build