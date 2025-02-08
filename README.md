# Self Hosted Ollama (Shollama)

# Purpose

Easy to setup, self-hosted, multi-model AI chatbot & API server.

# 3rd Party Components

* Ollama - https://ollama.com/
* Open Web UI - https://openwebui.com/
* Alexis - `./alexis`, An Alexa-like chatbot.
* Hardware?: See https://github.com/olafrv/ai_chat_llama2

# Usage

```bash	
git clone https://github.com/olafrv/ollama-combo.git
cd ollama-combo
# Tweak the configuration in .env
./start.sh
./models.sh
# Ollama require GPU (CUDA) to run
# See docker-compose.yml for more details
# Go to http://localhost:8080
# Or run any tests ./test*.sh
./stop.sh
```

# Explore

* https://docs.openwebui.com/features/plugin/functions/
* https://docs.openwebui.com/features/rag