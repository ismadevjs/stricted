# Use an official Alpine Linux runtime as a parent image
FROM alpine:latest

# Install bash and curl
RUN apk update && apk --no-cache add bash curl

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the shell script into the container
COPY check_ip.sh .

# Ensure the script is executable
RUN chmod +x check_ip.sh

# Run the shell script using bash
CMD ["bash", "./check_ip.sh"]
