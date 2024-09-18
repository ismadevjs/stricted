#!/bin/sh

# Log file location
LOGFILE="/app/visitor_log.txt"

# Get the current date and time
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Fetch the visitor data
VISITOR_DATA=$(curl -s -o /dev/null -w "%{http_code} %{url_effective}\n" https://jidli.com:8443/)

# Log the visitor data
echo "$TIMESTAMP - Visitor Data: $VISITOR_DATA" >> $LOGFILE
