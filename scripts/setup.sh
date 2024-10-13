#!/bin/bash

# Colors for output
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
RESET="\033[0m"

# Print a message in green (for success)
print_success() {
  echo -e "${GREEN}$1${RESET}"
}

# Print a message in yellow (for warnings)
print_warning() {
  echo -e "${YELLOW}$1${RESET}"
}

# Print a message in red (for errors)
print_error() {
  echo -e "${RED}$1${RESET}"
  exit 1
}

# Ensure script is run with root permissions
if [ "$EUID" -ne 0 ]; then
  print_error "Please run as root."
fi

# Step 1: Install required packages
print_success "Installing g++, make, and libsdl2-dev..."
apt-get update
apt-get install -y g++ make libsdl2-dev

# Step 2: Install node_modules inside 'social-network' folder
if [ -d "social-network/frontend" ]; then
  print_success "Installing node_modules inside 'social-network' folder..."
  cd social-network/frontend || print_error "'social-network' directory not found."
  npm install
  cd ../..
else
  print_error "'social-network' directory not found."
fi

# Step 3: Initialize .env file inside 'social-network/frontend'
NEXT_PUBLIC_SUPABASE_URL=$1
SUPABASE_SERVICE_ROLE_KEY=$2

if [ -z "$NEXT_PUBLIC_SUPABASE_URL" ] || [ -z "$SUPABASE_SERVICE_ROLE_KEY" ]; then
  print_error "Usage: $0 <NEXT_PUBLIC_SUPABASE_URL> <SUPABASE_SERVICE_ROLE_KEY>"
else
  ENV_PATH="social-network/frontend/.env"
  print_success "Creating .env file at '$ENV_PATH'..."

  cat > "$ENV_PATH" <<EOL
NEXT_PUBLIC_SUPABASE_URL=$NEXT_PUBLIC_SUPABASE_URL
SUPABASE_SERVICE_ROLE_KEY=$SUPABASE_SERVICE_ROLE_KEY
EOL

  print_success ".env file initialized successfully."
fi

# Step 4: Install node_modules inside 'void-js-app'
if [ -d "void-js-app" ]; then
  print_success "Installing node_modules inside 'void-js-app'..."
  cd void-js-app || print_error "'void-js-app' directory not found."
  npm install
  cd ..
else
  print_error "'void-js-app' directory not found."
fi

# Step 5: Run 'make' inside 'system-monitor'
if [ -d "system-monitor" ]; then
  print_success "Running 'make' inside 'system-monitor'..."
  cd system-monitor || print_error "'system-monitor' directory not found."
  make
  cd ..
else
  print_error "'system-monitor' directory not found."
fi

# Ensure the user is back in the root directory
cd "$OLDPWD" || exit
print_success "All tasks completed successfully!"
