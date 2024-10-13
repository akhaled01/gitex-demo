# Use the latest Ubuntu image as the base
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y git curl gnome-terminal

# Set the working directory
WORKDIR /root

# Expose the required ports
EXPOSE 8080 3000 9000

# Entry point script will handle further actions
COPY ./scripts/entrypoint.sh /root/entrypoint.sh
RUN chmod +x /root/entrypoint.sh

# Set the default command
ENTRYPOINT ["/root/entrypoint.sh"]
