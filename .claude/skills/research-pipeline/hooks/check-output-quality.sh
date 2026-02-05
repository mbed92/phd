#!/bin/bash
# Quality gate: validates stage output meets minimum requirements

STAGE=$1
OUTPUT_FILE=$2
MIN_WORDS=${3:-100}

if [ ! -f "$OUTPUT_FILE" ]; then
  echo "ERROR: Output file not found: $OUTPUT_FILE"
  exit 1
fi

WORD_COUNT=$(wc -w < "$OUTPUT_FILE")

if [ "$WORD_COUNT" -lt "$MIN_WORDS" ]; then
  echo "WARNING: Output seems sparse ($WORD_COUNT words, expected >$MIN_WORDS)"
  exit 1
fi

case $STAGE in
  "exploration")
    # Check for required sections
    REQUIRED=("Executive Summary" "Focus Area" "Priority\|Ranking")
    for pattern in "${REQUIRED[@]}"; do
      if ! grep -qE "$pattern" "$OUTPUT_FILE"; then
        echo "ERROR: Missing required section matching: $pattern"
        exit 1
      fi
    done
    ;;
  "ranking")
    # Check for Elo scores and table
    if ! grep -qE "[0-9]{4}" "$OUTPUT_FILE"; then
      echo "ERROR: No Elo scores found (expected 4-digit numbers)"
      exit 1
    fi
    ;;
  "review")
    # Check for verdict
    if ! grep -qiE "verdict|recommendation|assessment" "$OUTPUT_FILE"; then
      echo "ERROR: No verdict/recommendation found"
      exit 1
    fi
    ;;
esac

echo "Quality check passed for $STAGE: $WORD_COUNT words"
exit 0
