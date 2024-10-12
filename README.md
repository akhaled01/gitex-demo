# GITEX script guide

## Overview

This project contains several scripts for managing different applications within the directory. The primary entry point for running the scripts is the `run` script, which allows you to execute specific tasks based on the argument provided.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Running the Scripts](#running-the-scripts)
  - [Using the `run` Script](#using-the-run-script)
  - [Other Scripts](#other-scripts)
- [Error Handling](#error-handling)

## Prerequisites

- Ensure you have **Bash** installed on your system.
- Ensure you have **Docker** installed if you're running scripts that depend on Docker.
- Make sure the scripts are executable. You can set the executable permission using:

  ```bash
  chmod +x scripts/*.sh
  ```

> If you will use vscode's integrated terminal, run this command to allow sudo
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

## Error Handling

If any of the scripts fail to execute successfully, the output will indicate the failure, and you may want to check the logs or error messages provided by each script for further debugging.
