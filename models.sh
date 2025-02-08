#!/bin/bash

set -ex

# After start.sh download the models (once)

docker exec -it ollama ollama pull llama3.2
docker exec -it ollama ollama pull deepseek-r1
docker exec -it ollama ollama pull mistral

# Add more as you need here, model download is
# disable in env.ui.env for the Web UI to avoid
# users going wild ;) 