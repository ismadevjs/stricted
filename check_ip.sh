#!/bin/bash

# Define your allowed IPs
ALLOWED_IPS=("88.223.95.174" "127.0.0.1")

# Get the public IP address of the current machine
PUBLIC_IP=$(curl -s ifconfig.me)

# Function to add an iptables rule to allow traffic from a specific IP
allow_ip() {
  local ip=$1
  iptables -A INPUT -p tcp -s "$ip" --dport 8443 -j ACCEPT
}

# Function to add an iptables rule to deny traffic to a specific port
deny_all() {
  iptables -A INPUT -p tcp --dport 8443 -j DROP
}

# Check if the public IP is in the allowed IPs array
IP_ALLOWED=false
for ip in "${ALLOWED_IPS[@]}"; do
  if [[ "$PUBLIC_IP" == "$ip" ]]; then
    IP_ALLOWED=true
    break
  fi
done

# Apply firewall rules based on the IP check
if $IP_ALLOWED; then
  echo "IP $PUBLIC_IP is allowed. Configuring firewall rules to allow access to port 8443."
  allow_ip "$PUBLIC_IP"
else
  echo "IP $PUBLIC_IP is not allowed. Configuring firewall rules to deny access to port 8443."
  deny_all
fi