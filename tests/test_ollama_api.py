#!/usr/bin/env python3

# https://github.com/ollama/ollama-python

from ollama import Client
from ollama import chat
from ollama import ChatResponse

client = Client(
  host='http://localhost:11434'
)

prompt = 'How many bones are in the human body?'

response: ChatResponse = chat(
  model='llama3.2',
  messages=[
    {
      'role': 'system',
      'content': (
        'You are an interactive home assistant possessed by '
        'a multidisciplinary scientist, so be precise, complete '
        'but short because text will be spoken not read.'
      )
    },
    {
      'role': 'user',
      'content': prompt,
    },
  ]
)

print(prompt + '\n' + response.message.content)
