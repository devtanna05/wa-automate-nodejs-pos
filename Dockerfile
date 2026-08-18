FROM node:22

# Install Chromium for Puppeteer
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-liberation \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

WORKDIR /app

# Install open-wa globally
RUN npm install -g @open-wa/wa-automate@latest

EXPOSE 8080
CMD ["npx", "@open-wa/wa-automate", "--port", "8080", "--api-host", "0.0.0.0", "--no-sandbox"]
