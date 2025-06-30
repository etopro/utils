#!/bin/bash

# Build the rclone config file
CONFIG_PATH="$RCLONE_CONF_PATH"

{
  echo "[datasync]"
  
  for var in $(compgen -v RCLONE_); do
    key="${var#RCLONE_}"
    [[ "$key" == "CONF_PATH" ]] && continue
    echo "${key,,} = ${!var}"
  done
} > "$CONFIG_PATH"

echo "rclone config written to $CONFIG_PATH"
cat "$CONFIG_PATH" | sed -E '/[Kk][Ee][Yy]/s/(=).*/= [redacted]/'
