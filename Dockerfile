FROM node:22-slim

# Install system Chromium for Puppeteer
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-ipafont-gothic \
    fonts-wqy-zenhei \
    fonts-thai-tlwg \
    fonts-kacst \
    fonts-freefont-ttf \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

WORKDIR /app

# Install open-wa standalone CLI
RUN npm install -g @open-wa/wa-automate

EXPOSE 8080
CMD ["npx", "@open-wa/wa-automate", "--port", "8080", "--api-host", "0.0.0.0", "--no-sandbox"]
