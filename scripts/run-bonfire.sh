#!/bin/bash

# Color definitions for better readability
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to handle cleanup when CTRL+C is pressed
cleanup() {
    echo -e "${RED}Stopping Docker Compose...${NC}"
    # Redirect any errors to /dev/null
    sudo docker compose down &> /dev/null
    sudo docker rm -f frontend-container 2>/dev/null || true
    sudo docker rmi -f frontend-image 2>/dev/null || true
    echo -e "${GREEN}Docker Compose stopped and cleaned up.${NC}"
    exit 0
}

# Trap the CTRL+C signal (SIGINT) and call the cleanup function
trap cleanup SIGINT

# Navigate to the social-network directory
echo -e "${YELLOW}Navigating to the social-network directory...${NC}"
if cd social-network; then
    echo -e "${GREEN}Successfully navigated to social-network!${NC}"
else
    echo -e "${RED}Failed to find the social-network directory. Exiting...${NC}"
    exit 1
fi

# Start Docker Compose in detached mode
echo -e "${YELLOW}Starting Docker Compose in detached mode...${NC}"
if sudo docker compose up -d; then
    echo -e "${GREEN}Docker Compose started successfully in detached mode!${NC}"
else
    echo -e "${RED}Failed to start Docker Compose. Please check the logs for details.${NC}"
    exit 1
fi

# Wait until the user presses CTRL+C to stop the services
echo -e "${YELLOW}Press CTRL+C to stop Docker Compose and clean up.${NC}"
while true; do
    # Sleep to keep the script running
    sleep 1
done
