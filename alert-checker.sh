#!/bin/bash
# Price Alert Checker - runs every 5 minutes

# Simulated current prices (in real use, fetch from API)
TSLA_CURRENT=420.50
TSLA_THRESHOLD=$(echo "$TSLA_CURRENT * 0.95" | bc)
NQ_CURRENT=25650
NQ_THRESHOLD=25550

# Check TSLA
TSLA_TRIGGER=$(echo "$TSLA_CURRENT <= $TSLA_THRESHOLD" | bc)
if [ "$TSLA_TRIGGER" -eq 1 ]; then
    echo "🚨 ALERT: TSLA dropped 5%! Current: $TSLA_CURRENT"
    # Send to Telegram via Clawdbot
fi

# Check NQ
NQ_TRIGGER=$(echo "$NQ_CURRENT <= $NQ_THRESHOLD" | bc)
if [ "$NQ_TRIGGER" -eq 1 ]; then
    echo "🚨 ALERT: NQ dropped 100 pts! Current: $NQ_CURRENT"
    # Send to Telegram via Clawdbot
fi
