# Self Hosted Ollama (Shollama)

## Purpose

Easy to setup, self-hosted, multi-model AI chatbot & API server.

## 3rd Party Components

* Ollama - https://ollama.com/
* Open Web UI - https://openwebui.com/
* Alexis - `./alexis`, An Alexa-like chatbot.
* Hardware?: See https://github.com/olafrv/ai_chat_llama2

## Usage

```bash	
git clone https://github.com/olafrv/shollama.git
cd shollama
# Tweak the configuration in .env
./start.sh
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

## Integrating Ollama with VSCode

### GitHub Copilot Chat Extension

As of 18.07.2025:

Currently, only works with Chat mode and has limitations:
https://code.visualstudio.com/docs/copilot/language-models

You need to define the setting (and restart VSCode):
GitHub › Copilot › Chat › Byok: Ollama Endpoint

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

This model is not downloaded by default, so:

```bash
# Edit ./models.sh, or pull it manually running:
docker exec -it ollama ollama pull qwen2.5-coder:7b
```

## Discarded

* Continue requires 3 models running to operate (too much):
  https://docs.continue.dev/customize/model-providers/top-level/ollama

## To Explore

* https://docs.openwebui.com/features/plugin/functions/
* https://docs.openwebui.com/features/rag