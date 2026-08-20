FROM openwa/wa-automate:latest

# Use stable 4.76.0 release as recommended by README
EXPOSE 8080
CMD ["npx", "@open-wa/wa-automate@4.76.0", "--port", "8080", "--api-host", "0.0.0.0", "--no-sandbox"]
