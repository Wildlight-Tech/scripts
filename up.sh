#!/bin/bash

# Set the working directory
WORKDIR="/Users/devin/Documents/DARC/BarSync/helm-values"

# Check if Docker is installed
if ! command -v docker &> /dev/null
then
    echo "Docker is not installed. Please install Docker first."
    exit 1
fi

# Navigate to the directory containing your compose file
cd "$WORKDIR" || { echo "Failed to change directory to $WORKDIR"; exit 1; }

# Pull the latest images
echo "Pulling latest Docker images..."
docker compose pull

# Start the containers in detached mode
echo "Starting containers..."
docker compose up -d

# Show running containers
echo "Current running containers:"
docker ps

# Exit successfully
exit 0