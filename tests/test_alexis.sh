#!/bin/bash
source ./env.global.env
PROMPT="What is the capital of France?"
echo $PROMPT
curl -X POST -H "Authorization: Bearer ${OLLAMA_API_KEY}" \
    -H "Content-Type: application/json" \
    -d "{\"question\": \"${PROMPT}\"}" \
    http://localhost:11435/ask
