import os

from dotenv import load_dotenv
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from openai import OpenAI

load_dotenv()

api_key = os.getenv("OPENAI_API_KEY")
if not api_key:
    raise RuntimeError("OPENAI_API_KEY is missing from .env")

client = OpenAI(api_key=api_key)
app = FastAPI(title="ASTRA AI API")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=False,
    allow_methods=["*"],
    allow_headers=["*"],
)


class ChatRequest(BaseModel):
    message: str


@app.get("/")
def root():
    return {"status": "ASTRA AI online"}


@app.post("/chat")
def chat(request: ChatRequest):
    message = request.message.strip()
    if not message:
        raise HTTPException(status_code=400, detail="Message cannot be empty")

    try:
        response = client.responses.create(
            model="gpt-5-mini",
            instructions=(
                "You are ASTRA AI, a concise and friendly astronomy assistant inside "
                "the ASTRA mobile app. Focus on astronomy, astrophysics, planets, stars, "
                "galaxies, telescopes and space exploration. Clearly say when you are uncertain."
            ),
            input=message,
        )
        return {"reply": response.output_text}
    except Exception as exc:
        raise HTTPException(status_code=500, detail=str(exc)) from exc
