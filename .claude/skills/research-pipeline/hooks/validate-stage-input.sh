#!/bin/bash
# Validates that required input exists before each pipeline stage

STAGE=$1
INPUT_FILE=$2

case $STAGE in
  "ranking")
    # Stage 2: Verify research-summary.md has focus areas
    if [ ! -f "$INPUT_FILE" ]; then
      echo "ERROR: Missing input file: $INPUT_FILE"
      exit 1
    fi
    if ! grep -q "Focus Area\|focus area" "$INPUT_FILE"; then
      echo "ERROR: No focus areas found in $INPUT_FILE"
      exit 1
    fi
    ;;
  "review")
    # Stage 3: Verify rankings exist
    if [ ! -f "$INPUT_FILE" ]; then
      echo "ERROR: Missing input file: $INPUT_FILE"
      exit 1
    fi
    if ! grep -q "Elo\|elo\|Rank\|rank" "$INPUT_FILE"; then
      echo "ERROR: No rankings found in $INPUT_FILE"
      exit 1
    fi
    ;;
  *)
    # Stage 1 or unknown: no validation needed
    ;;
esac

echo "Validation passed for stage: $STAGE"
exit 0
