#get our environment variables
# py -3 -m venv .venv
# .venv\Scripts\activate
#pip install fastapi uvicorn 
import os
\
from dotenv import load_dotenv, find_dotenv
from datetime import datetime
from fastapi import FastAPI, WebSocket, WebSocketDisconnect
from fastapi.middleware.cors import CORSMiddleware
from dataclasses import dataclass
from typing import Dict
import uuid
import json
import openai
#get embeddings of llms from langchain
from langchain.llms import openai
from langchain.prompts import PromptTemplate
from langchain.chains import LLMChain
#from langchain.embeddings import OpenAIEmbeddings

#load env
load_dotenv(find_dotenv())

#our connection manager to manage connetions
@dataclass
class ConnectionManager:
    def __init__(self) -> None:
        self.active_connectio: dict = {}

    #creat connection object to manage active connection
    async def making_connection(self, webSocket: WebSocket):
        #accpet connection
        await webSocket.accept()
        #add uuid to connection to websoclet connection to tract connection
        id = str(uuid.uuid4())
        #id  the key and websocket conncetion the value
        self.active_connectio[id] = webSocket

        #send connection accepted msg in json
        connection_msg = json.dumps({"isMe": True, "username": "You", "msg": "connected to the chat"})
        #send messages in our connection
        await webSocket.send_message(webSocket, connection_msg)
    async def send_messages(self, webSocket: WebSocket, msg: str):
        await webSocket.send_text()  



############# working on th

app = FastAPI()






#add cors middleware
"""
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"]
)
"""

#gets api from env file and uses it to call open ai embedding 
#embeddings = OpenAIEmbeddings()
#text = 'sample'
#text_embeddings = embeddings.embed_documents([text])


#routes
#testing route
@app.get("/")
def get_app():
    return {"Hello"}

#connection manager to manage the connection to our chatapp
connection_manager = ConnectionManager()

@app.websocket("/ws")
async def websocket_endpoint(websocket: WebSocket):
    #let connection manager manage the connections
    connection_manager.connect(websocket)
    #while channel is open we will accept data
    while True:
        data = await websocket.receive_text()
        await websocket.send_text(f"Message text was: {data}")


