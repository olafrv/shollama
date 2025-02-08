#!/bin/bash

set -ex

# After start.sh download the models (once)

# See models list at https://ollama.com/library

docker exec -it ollama ollama pull llama3.2:1b
docker exec -it ollama ollama pull deepseek-r1:1.5b
docker exec -it ollama ollama pull qwen2.5-coder:1.5b
docker exec -it ollama ollama pull mistral:7b

# Add more as you need here, model download is
# disable in env.ui.env for the Web UI to avoid
# users going wild ;) 