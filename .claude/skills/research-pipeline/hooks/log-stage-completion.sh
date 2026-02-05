#!/bin/bash
# Logs pipeline stage completion with timestamp

STAGE=${1:-"unknown"}
STATUS=${2:-"complete"}
LOG_DIR="$(dirname "$0")/../memory"
LOG_FILE="$LOG_DIR/pipeline.log"

# Ensure log directory exists
mkdir -p "$LOG_DIR"

TIMESTAMP=$(date -Iseconds)
ENTRY="$TIMESTAMP | Stage: $STAGE | Status: $STATUS"

echo "$ENTRY" >> "$LOG_FILE"
echo "$ENTRY"
