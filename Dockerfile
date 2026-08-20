FROM openwa/wa-automate:latest

EXPOSE 8080
CMD ["sh", "-c", "npx @open-wa/wa-automate@4.76.0 --port ${PORT:-8080} --api-host 0.0.0.0 --no-sandbox --skip-save-postman-collection"]
