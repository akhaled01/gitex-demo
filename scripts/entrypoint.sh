#!/bin/bash

# Get the repository URL and keys from CLI arguments
REPO_URL=$1
KEY1=$2
KEY2=$3

# Check if all required arguments are provided
if [ -z "$REPO_URL" ] || [ -z "$KEY1" ] || [ -z "$KEY2" ]; then
  echo "Error: Missing arguments. Usage: <REPO_URL> <KEY1> <KEY2>"
  exit 1
fi

# Clone the Git repository
git clone "$REPO_URL" gitex-demo

# Navigate into the cloned repository
cd gitex-demo || { echo "Directory gitex-demo not found!"; exit 1; }

# Run the setup script with the provided keys
source ./scripts/setup.sh "$KEY1" "$KEY2"

# Navigate back to the project root directory
cd ..

clear

echo

cat << 'EOF'

    ░▒▓███████▓▒░░▒▓████████▓▒░▒▓███████▓▒░ ░▒▓██████▓▒░ ░▒▓██████▓▒░▒▓████████▓▒░▒▓████████▓▒░  ░▒▓█▓▒░ 
    ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░▒▓████▓▒░ 
    ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░ 
    ░▒▓███████▓▒░░▒▓██████▓▒░ ░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░ 
    ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░ 
    ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░ 
    ░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓███████▓▒░ ░▒▓██████▓▒░ ░▒▓██████▓▒░  ░▒▓█▓▒░   ░▒▓████████▓▒░  ░▒▓█▓▒░ 
                                                                                                        
                                                                                                        

EOF


# print welcome guide
print_success "Welcome to GitEx Demo!"
print_success "This is a demo environment for showcasing reboot01 projects."
print_success "Check out the README.md file for more information."
print_success "All ports are exposed, and nvm is sourced, so you can run any project."
print_warning "please note that system-monitor is not going to run in this environment."

# Open a new GNOME terminal shell inside the container at ~/gitex-demo
exec bash
