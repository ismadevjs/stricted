# Use an official Alpine Linux runtime as a parent image
FROM alpine:latest

# Install bash, curl, and iptables
RUN apk --no-cache add bash curl iptables

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the shell script into the container
COPY check_ip.sh .

# Ensure the script is executable
RUN chmod +x check_ip.sh

# Verify the script is there and executable
RUN ls -l /usr/src/app

# Run the shell script using bash
CMD ["bash", "./check_ip.sh"]
