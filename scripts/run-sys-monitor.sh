#!/bin/bash

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Start building process
echo -e "${YELLOW}Starting the build process for sys-dog...${NC}"

# Run make command in the system-monitor directory
if make -C system-monitor; then
    echo -e "${GREEN}Build completed successfully!${NC}"
else
    echo -e "${RED}Build failed. Exiting...${NC}"
    exit 1
fi

# Notify that sys-dog is starting
echo -e "${YELLOW}Starting sys-dog...${NC}"

# Navigate to the system-monitor directory and run the monitor program
cd system-monitor || { echo -e "${RED}Failed to change directory to system-monitor. Exiting...${NC}"; exit 1; }
./monitor

# Completion message
echo -e "${GREEN}sys-dog is now running!${NC}"
