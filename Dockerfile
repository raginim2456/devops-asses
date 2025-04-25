# -------------------
# Stage 1: Node.js Scraper
# -------------------
FROM node:18-slim AS scraper

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

# Install Chromium and fonts
RUN apt-get update && \
    apt-get install -y chromium chromium-common fonts-liberation libxss1 libappindicator3-1 libatk-bridge2.0-0 libasound2 libnspr4 libnss3 xdg-utils && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Create app directory and copy script
WORKDIR /app
COPY scrape.js ./
RUN npm init -y && npm install puppeteer

# Run the scraper
ENV SCRAPE_URL=https://example.com
RUN node scrape.js

# -------------------
# Stage 2: Python Web Server
# -------------------
FROM python:3.10-slim

# Install dependencies
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy only the result JSON and server script
COPY --from=scraper /app/scraped_data.json .
COPY server.py .

EXPOSE 5000
CMD ["python", "server.py"]
