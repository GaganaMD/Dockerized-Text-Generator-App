from fastapi import FastAPI
from transformers import pipeline #To call LLM models present in huggingface

# create a new FASTAPI app instance
app = FastAPI()

# initialize the text generation pipeline
pipe = pipeline("text2text-generation", model="google/flan-t5-small")


@app.get("/")

def home():
    return {"message":"Hello World"}


# Define a function to handle the GET request at "/generate"

@app.get("/generate")

def generate(text:str):

    # use the pipeline to generate text from given input text

    output = pipe(text)

    # Return the generated text in Json format

    return {"output":output[0]['generated text']}