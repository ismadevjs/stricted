#!/bin/sh

# Log file location
LOGFILE="/app/visitor_log.txt"

# Get the current date and time
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Log start of execution
echo "$TIMESTAMP - Script started" >> $LOGFILE

# Fetch the IP address of the container
CONTAINER_IP=$(curl -s https://api.ipify.org)

# Fetch the visitor data
VISITOR_DATA=$(curl -s -o /dev/null -w "%{http_code} %{url_effective}\n" https://jidli.com:8443/)

# Log the visitor data and IP
echo "$TIMESTAMP - Container IP: $CONTAINER_IP" >> $LOGFILE
echo "$TIMESTAMP - Visitor Data: $VISITOR_DATA" >> $LOGFILE

# Log end of execution
echo "$TIMESTAMP - Script finished" >> $LOGFILE
