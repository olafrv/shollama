#!/bin/bash

set -ex

# After start.sh download the models (once)

# See models list at https://ollama.com/library

# Example models to pull:
# docker exec -it ollama ollama pull llama3.2:1b
# docker exec -it ollama ollama pull deepseek-r1:1.5b
# docker exec -it ollama ollama pull qwen2.5-coder:1.5b
# docker exec -it ollama ollama pull mistral:7b

# Default models required by Continue.Dev VSCode extension
docker exec -it ollama ollama pull llama3.1:8b
docker exec -it ollama ollama pull qwen2.5-coder:1.5b-base
docker exec -it ollama ollama pull nomic-embed-text:latest

# Add more as you need here, model download is
# disable in env.ui.env for the Web UI to avoid
# users going wild ;) 