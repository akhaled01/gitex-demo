# GITEX Script Guide

## Overview

This project contains several scripts for managing different applications within the directory. The primary entry point for running the scripts is the `run` script, which allows you to execute specific tasks based on the argument provided.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Running the Scripts](#running-the-scripts)
  - [Using the `run` Script](#using-the-run-script)
  - [Other Scripts](#other-scripts)
  - [Setup Script](#setup-script)
  - [Dockerization Script](#dockerization-script)
- [Error Handling](#error-handling)

## Prerequisites

- Ensure you have **Bash** installed on your system.
- Ensure you have **Docker** installed if you're running scripts that depend on Docker.
- Make sure the scripts are executable. You can set the executable permission using:

  ```bash
  chmod +x scripts/*.sh
  ```

> [!IMPORTANT]  
> If you will use vscode's integrated terminal, run this command to allow sudo:
> `code gitex-projects --no-sandbox`

## Running the Scripts

### Using the `run` Script

The `run` script serves as the main entry point for executing different tasks. It requires one argument to specify which script to run.

#### Usage

```bash
./run [bonfire|monitor|void]
```

- **bonfire**: Runs the Bonfire (social network) script.
- **monitor**: Runs the System Monitor script.
- **void**: Runs the Void.js script.

#### Example Commands
- To run the Bonfire script:

  ```bash
  ./run bonfire
  ```
- To run the System Monitor script:

  ```bash
  ./run monitor
  ```
- To run the Void.js script:

  ```bash
  ./run void
  ```

#### Error Handling
- If no argument is provided, the script will display an error message and usage instructions:

  ```
  Error: No argument provided.
  Usage: ./run [bonfire|monitor|void]
  ```
- If an invalid argument is provided, an error message will indicate the valid options:

  ```
  Error: Invalid argument 'your_invalid_argument'.
  Valid options are: bonfire, monitor, void.
  ```

### Other Scripts

In addition to the `run` script, you can directly run the individual scripts located in the `scripts` directory:

- **Bonfire Script**

  ```bash
  ./scripts/run-bonfire.sh
  ```

- **System Monitor Script**

  ```bash
  ./scripts/run-sys-monitor.sh
  ```

- **Void.js Script**

  ```bash
  ./scripts/run-void-js.sh
  ```

### Example Usage of Other Scripts
- To run the System Monitor script directly:

  ```bash
  ./scripts/run-sys-monitor.sh
  ```

### Setup Script

The `setup.sh` script is designed to install necessary dependencies and configure the environment for the project.

#### Usage

```bash
./scripts/setup.sh <NEXT_PUBLIC_SUPABASE_URL> <SUPABASE_SERVICE_ROLE_KEY>
```

- **NEXT_PUBLIC_SUPABASE_URL**: The URL for your Supabase project.
- **SUPABASE_SERVICE_ROLE_KEY**: The service role key for accessing Supabase.

#### Example Command
To set up your environment, you can run:

```bash
./scripts/setup.sh "https://your-supabase-url" "your-service-role-key"
```

The script will create an `.env` file with the provided values, install necessary node modules, and ensure that all dependencies are correctly set up.

### Dockerization Script

The `dockerize.sh` script is used to create a Docker container with the necessary environment for running the application.

#### Usage

```bash
./scripts/dockerize.sh <NEXT_PUBLIC_SUPABASE_URL> <SUPABASE_SERVICE_ROLE_KEY>
```

- **NEXT_PUBLIC_SUPABASE_URL**: The URL for your Supabase project.
- **SUPABASE_SERVICE_ROLE_KEY**: The service role key for accessing Supabase.

#### Example Command
To dockerize the application, run:

```bash
./scripts/dockerize.sh "https://your-supabase-url" "your-service-role-key"
```

This script will:
1. Pull the latest Ubuntu Docker image and install Git.
2. Clone the specified repository into the container.
3. Expose ports 8080, 3000, and 9000.
4. Run the setup script inside the cloned repository.
5. Open a new bash session inside the container at `~/gitex-demo`.

> [!CAUTION]
> note that system-monitor will not run if inside the docker container

## Error Handling

If any of the scripts fail to execute successfully, the output will indicate the failure, and you may want to check the logs or error messages provided by each script for further debugging.
