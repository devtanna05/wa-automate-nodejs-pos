FROM ghcr.io/open-wa/wa-automate-nodejs:latest

EXPOSE 8080
CMD ["npx", "@open-wa/wa-automate", "--port", "8080", "--api-host", "0.0.0.0", "--no-sandbox"]
