
from flask import Flask, request, jsonify  # type: ignore
from flask_httpauth import HTTPTokenAuth  # type: ignore
from ollama import Client, ChatResponse
from asgiref.wsgi import WsgiToAsgi  # type: ignore
import uvicorn
import os

OLLAMA_BASE_URL = os.getenv("OLLAMA_BASE_URL")
OLLAMA_API_KEY = os.getenv("OLLAMA_API_KEY")
if not OLLAMA_API_KEY:
    raise ValueError("Environment variable OLLAMA_API_KEY must be set")

TOKENS = {OLLAMA_API_KEY: "authorized_user"}

app = Flask(__name__)
asgi_app = WsgiToAsgi(app)

auth = HTTPTokenAuth(scheme="Bearer")

client = Client(host=OLLAMA_BASE_URL)
client.pull('llama3.2')


@auth.verify_token
def verify_token(token):
    return TOKENS.get(token)


@app.route('/ask', methods=['POST'])
@auth.login_required
def ask_question():
    data = request.get_json()
    question = data.get("question", "").strip()

    if not question:
        return jsonify({"error": "No question provided"}), 400

    app.logger.info(f"Received question: {question}")

    app.logger.info(f"Connecting to OLLAMA at {OLLAMA_BASE_URL}")

    response: ChatResponse = client.chat(
        model='llama3.2',
        messages=[
            {
                'role': 'system',
                'content': (
                    'You are an Amazon Alexa Echo Dot assistant possessed by '
                    'a multidisciplinary scientist, so be precise, complete '
                    'but short because text will be spoken not read.'
                )
            },
            {
                'role': 'user',
                'content': question,
            },
        ]
    )

    return jsonify(response.message.content)


if __name__ == '__main__':

    # flask built-in dev server
    # app.run(host='0.0.0.0', port=11435, debug=True)

    # uvicorn server for production
    uvicorn.run(asgi_app, host='0.0.0.0', port=11435)
