#!/bin/bash

source .env.sh

adb root

adb reverse tcp:$ATLW_PORT tcp:$ATLW_PORT

# HOME: restic uses ~/.cache/restic for caching
# PATH: make programs installed inside Termux accessible; other programs are not needed, therefore the env var is overwritten and not extended
COMMAND_PHONE="adb shell \"export HOME='/data/root' && \
export PATH='/data/data/com.termux/files/usr/bin/' && \
export RESTIC_PASSWORD='$ATLW_REPO_PASSWORD' && \
restic backup --verbose --host $ATLW_PHONE_NAME --repo rest:http://127.0.0.1:$ATLW_PORT $ATLW_BACKUP_DIR\""

COMMAND_SERVER="rest-server --append-only --no-auth --listen 127.0.0.1:$ATLW_PORT --path $ATLW_REPO_PATH"

npx concurrently --success first --kill-others --names "phone,server" "$COMMAND_PHONE" "$COMMAND_SERVER"

adb reverse --remove tcp:$ATLW_PORT
