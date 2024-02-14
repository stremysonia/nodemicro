FROM python:3.12.0

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

EXPOSE 8000

CMD [ "python3", "-m", "uvicorn", "main:app"]