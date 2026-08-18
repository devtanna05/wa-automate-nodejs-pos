FROM node:18-slim

# Install Chrome dependencies for Puppeteer/OpenWA
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    ca-certificates \
    procps \
    libsqlite3-dev \
    libgconf-2-4 \
    libxv1 \
    libgtk-3-0 \
    libgbm-dev \
    libnss3 \
    libasound2 \
    fonts-liberation \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY package*.json ./
RUN npx pnpm install
COPY . .

EXPOSE 8080
CMD ["npx", "pnpm", "start"]
