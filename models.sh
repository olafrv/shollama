#!/bin/bash

set -ex

# After start.sh download the models (once)

# See models list at https://ollama.com/library

# Models for CPU and small RAM machines:
# docker exec -it ollama ollama pull gemma3:1b
# docker exec -it ollama ollama pull llama3.2:1b
# docker exec -it ollama ollama pull llama3.2:latest
# docker exec -it ollama ollama pull deepseek-r1:1.5b
# docker exec -it ollama ollama pull dolphin-mistral:7b
# docker exec -it ollama ollama pull qwen2.5-coder:1.5b

# Default models required by Continue.Dev VSCode extension
# docker exec -it ollama ollama pull llama3.1:8b
# docker exec -it ollama ollama pull qwen2.5-coder:1.5b-base
# docker exec -it ollama ollama pull nomic-embed-text:latest

# Default models required by ComfyUI for image processing
# docker exec -it ollama ollama pull dolphin-mistral:latest
# docker exec -it ollama ollama pull qwen3-vl:8b
# docker exec -it ollama ollama pull huihui_ai/qwen3-vl-abliterated:latest
# docker exec -it ollama ollama pull huihui_ai/qwen3-vl-abliterated:4b

# Add more as you need here, model download is
# disable in env.ui.env for the Web UI to avoid
# users going wild ;) 
