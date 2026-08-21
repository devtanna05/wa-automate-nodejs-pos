FROM node:18-slim

# Install Chromium for Puppeteer
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-liberation \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

WORKDIR /app

# Pre-install open-wa during build so startup is instant (0s download delay)
RUN npm install -g @open-wa/wa-automate@4.76.0

EXPOSE 8080
ENTRYPOINT []
CMD ["wa-automate", "--port", "8080", "--api-host", "0.0.0.0", "--no-sandbox", "--skip-postman-collection"]
