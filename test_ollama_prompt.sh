#!/bin/bash
PROMPT="What is the capital of France?"
echo $PROMPT
docker exec -it ollama ollama run llama3.2 "$PROMPT"

# There are other terminal commands that can be used,
# For more information, please visit the following link:
# https://github.com/ollama/ollama/tree/main?tab=readme-ov-file#terminal
