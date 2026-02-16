# Self Hosted Ollama (Shollama)

## Purpose

Easy to setup, self-hosted, multi-model AI chatbot & API server.

## Components

* Ollama: https://ollama.com/
* Open Web UI: https://openwebui.com/
* Alexis: See `./alexis` an Alexa-like chatbot.

## Configuration

Clone the repository and set up the environment:
```sh	
git clone https://github.com/olafrv/shollama.git
cd shollama
```

Create `env.global.env` with the following content:
```sh
OLLAMA_BASE_URL=http://ollama:11434
OLLAMA_API_KEY=FOR_GOD_SAKE_CHANGE_ME
```

Create `env.ui.env` with the following content:
```sh
HF_HUB_OFFLINE=0
WEBUI_NAME="Self Hosted Ollama"
WEBUI_URL="http://localhost:8080"
PORT=8080
ENABLE_SIGNUP=true
ENABLE_OAUTH_SIGNUP=false
ENABLE_REALTIME_CHAT_SAVE=true
ENABLE_ADMIN_EXPORT=false
USE_CUDA_DOCKER=true
ENABLE_EVALUATION_ARENA_MODELS=False
```

## NVIDIA GPU Support

Enable Docker NVIDIA GPU Support, which means, you need to install NVIDIA
CUDA drivers, do checks, NVIDIA container toolkit, do checks, then install
finally restart Docker.

See https://github.com/olafrv/nvidia-docker-wsl

## Start Services

Then run the following commands to start the services:
```sh
./start.sh
# Uncomment models as needed in models.sh, or pull them manually running:
# docker exec -it ollama ollama pull <model>:<tag>
./models.sh  
# Ollama require GPU (CUDA) to run, but
# in docker-compose.yml can be disabled.
# Go to http://localhost:8080
# Or run any tests ./test*.sh
./stop.sh
```

## Common Errors

### Ollama

* `docker: ()...) could not select device driver "nvidia" (...) [[gpu]]`,
  Comment the 'deploy' section in docker-compose.yaml for ollama service.

### Open Web UI

* `Cannot find local snapshot HF_HUGGING_OFFLINE=1`. Set it to 0 in `env.iu.env`,
  you can set it back after the first run.

### Test API
```sh
# Test Ollama API
curl http://localhost:11434/api/generate \
    -d '{ "model": "llama3.2", "prompt": "How are you today?"}'
```

## Integrating Ollama with VSCode

## Continue.dev Chat Extension

Continue requires 3 models:
* Chat (and Edit): llama3.1:8b
* Autocomplete: qwen2.5-coder:1.5b-base
* Embedding: nomic-embed-text:latest

Reference:
* https://docs.continue.dev/ide-extensions/install

### GitHub Copilot Chat Extension

As of 16.02.2026 and only for VSCode Insiders.

Currently, only works with Chat mode and has limitations:
https://code.visualstudio.com/docs/copilot/customization/language-models#_bring-your-own-language-model-key

You need to define the setting (and restart VSCode):
GitHub › Copilot › Chat › Byok: Ollama Endpoint

If you have a Github Copilot Business or Enterprise, 
you can't use local models (Organization Restriction).

### ChatGPT Copilot Extension

As of 17.08.2025:

Currently, works but not as flowlessly as GitHub Copilot:

https://github.com/feiskyer/chatgpt-copilot

After install, go to Settings > Filter by ChatGPT,
set the following parameters (ChatGPT > Gpt3):

* Provider LLM: Ollama
* API Key: FOR_GOD_SAKE_CHANGE_ME
* API Base Url: Leave it in blank
* Model: custom
* Custom Model: qwen2.5-coder:7b
