#!/bin/bash

# Set fixed Govee hostname or IP address
GOVEE_IP="192.168.0.1"
GOVEE_PORT=4003

# Check for 1 argument
[ $# -ne 1 ] && exit 1

INPUT=$1

# Validate that it's an integer 0–255
if ! [[ "$INPUT" =~ ^[0-9]+$ ]] || [ "$INPUT" -lt 0 ] || [ "$INPUT" -gt 255 ]; then
  exit 1
fi

# Convert 0–255 to 0–100 using bc (rounded)
BRIGHTNESS=$(echo "scale=0; ($INPUT*100+127)/255" | bc)

# Build correct JSON command
if [ "$BRIGHTNESS" -eq 0 ]; then
  JSON='{"msg":{"cmd":"turn","data":{"value":"off"}}}'
else
  JSON="{\"msg\":{\"cmd\":\"brightness\",\"data\":{\"value\":$BRIGHTNESS}}}"
fi

# Send via socat
echo "$JSON" | socat - UDP-DATAGRAM:$GOVEE_IP:$GOVEE_PORT
