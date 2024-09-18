#!/bin/bash

# Define allowed IPs in an array
allowed_ips=("123.123.123.123" "234.234.234.234")

# Retrieve the real IP address from a request
# Replace this with actual logic for your environment
# For testing purposes, we'll use a placeholder IP address
visitor_ip=$(curl -s http://api.ipify.org)

# Check if the visitor's IP is in the allowed list
ip_found=false
for ip in "${allowed_ips[@]}"; do
  if [ "$visitor_ip" == "$ip" ]; then
    ip_found=true
    break
  fi
done

# Log the result
if [ "$ip_found" = true ]; then
  echo "IP $visitor_ip is allowed."
else
  echo "IP $visitor_ip is not allowed."
  # Optional: Configure firewall rules or other actions
fi
