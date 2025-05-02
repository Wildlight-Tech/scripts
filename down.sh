#!/bin/bash

# Set the working directory
WORKDIR="$HOME/Documents/DARC/BarSync/helm-values"

# Check if Docker is installed
if ! command -v docker &> /dev/null
then
    echo "Docker is not installed. Please install Docker first."
    exit 1
fi

# Navigate to the directory containing your compose file
cd "$WORKDIR" || { echo "Failed to change directory to $WORKDIR"; exit 1; }

# Stop the containers
echo "Closing containers..."
docker compose down

# Prune the containers
echo "Pruning containers..."
docker container prune

# Prune the images
echo "Pruning images..."
docker image prune

# Prune the volumes
echo "Pruning volumes..."
docker volume prune

# Prune the networks
echo "Pruning networks..."
docker network prune

# Exit successfully
exit 0