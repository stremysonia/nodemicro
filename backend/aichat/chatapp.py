#get our environment variables
# py -3 -m venv .venv
# .venv\Scripts\activate
#pip install fastapi uvicorn 
from dotenv import load_dotenv
from datetime import datetime
import json
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
#get embeddings of llms from langchain
from langchain.embeddings import OpenAIEmbeddings

#start webserver
app = FastAPI()

load_dotenv()
#add cors middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"]
)

#gets api from env file and uses it to call open ai embedding 
embeddings = OpenAIEmbeddings()
text = 'sample'
text_embeddings = embeddings.embed_documents([text])


#routes
@app.get("/")
def home():
    "app is running"




