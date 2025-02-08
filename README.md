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

### Install Continue Package

https://docs.continue.dev/getting-started/install
https://marketplace.visualstudio.com/items?itemName=Continue.continue

### Configure Ollama as Model in Continue

https://docs.continue.dev/customize/model-providers/ollama#using-a-remote-instance

```json
{
  "models": [
    {
      "title": "deepseek-r1",
      "provider": "ollama",
      "model": "deepseek-r1",
      "apiBase": "http://localhost:11434"
    },
    {
      "title": "qwen2.5-coder",
      "provider": "ollama",
      "model": "qwen2.5-coder:1.5b",
      "apiBase": "http://localhost:11434"
    },
  ]
}
```

## To Explore

* https://docs.openwebui.com/features/plugin/functions/
* https://docs.openwebui.com/features/rag
