FROM python:3.12-slim

WORKDIR /app

ENV PYTHONUNBUFFERED=1

# Install deps here (same pins as requirements.txt) so Railway/Docker builds
# succeed even if requirements.txt was not committed or Root Directory omits it.
COPY bot.py ./
RUN mkdir -p assets data \
    && pip install --no-cache-dir \
        "python-telegram-bot>=21.6" \
        "python-dotenv>=1.0.0" \
        "aiohttp>=3.9.0"

# Banner is optional. Build never requires header.png.
# Option A — add to repo an assets/ folder with header.png, then uncomment:
# COPY assets ./assets
# Option B — Railway volume on /app/assets with header.png, or env BOT_HEADER_IMAGE

CMD ["python", "bot.py"]
