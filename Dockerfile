# Use an Alpine base image for a small footprint
FROM alpine:latest

# Install necessary tools
RUN apk add --no-cache curl

# Copy the shell script into the container
COPY log_visitors.sh /usr/local/bin/log_visitors.sh

# Make the shell script executable
RUN chmod +x /usr/local/bin/log_visitors.sh

# Create a directory for logs
RUN mkdir -p /app

# Set the working directory
WORKDIR /app

# Run the shell script by default
CMD ["/usr/local/bin/log_visitors.sh"]
