# Use an official base image (Change according to your application)
FROM ubuntu:latest

# Set the working directory inside the container
WORKDIR /app

# Install required dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy application files to the container
COPY . .

# Expose necessary ports (Change according to your application)
EXPOSE 8080

# Define the startup command (Modify as per your app)
CMD ["python3", "app.py"]
