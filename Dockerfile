FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && apt-get install -y git libcairo2 poppler-utils
RUN apt-get update && apt-get install -y ffmpeg

COPY requirements.txt .
RUN pip install --no-cache-dir -U yt-dlp
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]