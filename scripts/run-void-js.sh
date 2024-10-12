#!/bin/bash

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Navigating to the project directory
echo -e "${YELLOW}Navigating to the Void.js app directory...${NC}"
if cd void-js-app; then
    echo -e "${GREEN}Successfully navigated to void-js-app!${NC}"
else
    echo -e "${RED}Failed to find the void-js-app directory. Exiting...${NC}"
    exit 1
fi

# Running the Void.js development server
echo -e "${YELLOW}Starting the Void.js development server...${NC}"
if npm run dev; then
    echo -e "${GREEN}Void.js development server is now running!${NC}"
else
    echo -e "${RED}Failed to start the Void.js development server. Exiting...${NC}"
    exit 1
fi
