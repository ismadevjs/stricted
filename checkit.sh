#!/bin/bash

# Define the array of IPs
ips=("197.203.185.29" "10.0.0.1" "172.16.0.1")

# Get the real IP address (assuming it's obtained from a command or a service)
# For demonstration purposes, we'll use the public IP from an external service
real_ip=$(curl -s ifconfig.me)

# Check if the real IP is in the array
if [[ " ${ips[@]} " =~ " ${real_ip} " ]]; then
  echo "The IP address ${real_ip} is in the array."
else
  echo "The IP address ${real_ip} is not in the array."
fi
