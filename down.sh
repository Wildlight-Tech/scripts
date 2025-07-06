#!/bin/bash

# Set the working directory
WORKDIR="$HOME/Documents/DARC/Brands/AIHG/App/helm-values"

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
echo "Pruning images/containers/networks..."
docker system prune -a --volumes -f

# Prune the volumes
echo "Pruning volumes..."
docker volume prune -a -f

# Exit successfully
exit 0
