#!/bin/bash

# Ensure the keys are provided
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <KEY1> <KEY2>"
  exit 1
fi

KEY1=$1
KEY2=$2
REPO_URL="https://github.com/akhaled01/gitex-demo.git"

# Build the Docker image
docker build -t ubuntu-gitex .

# Run the Docker container, passing in the repo URL and keys as arguments
docker run -it --rm \
  -p 8080:8080 -p 3000:3000 -p 9000:9000 \
  ubuntu-gitex "$REPO_URL" "$KEY1" "$KEY2"
