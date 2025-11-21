#!/bin/bash

# Navigate to the directory containing your docker-compose.yml file
# cd /path/to/your/docker-compose-project

echo "Stopping and removing existing Docker Compose services..."
docker compose down --rmi all

echo "Pulling latest images (if any services use pre-built images)..."
docker compose pull

echo "Building/rebuilding images from Dockerfiles..."
# --no-cache can be added to force a complete rebuild without using cached layers
docker compose build --no-cache

echo "Starting Docker Compose services..."
# -d runs services in detached mode
docker compose up -d --force-recreate

echo "Docker Compose environment rebuilt and started."