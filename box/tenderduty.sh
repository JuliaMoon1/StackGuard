#!/bin/bash

# Check if a tmux session named "tenderduty" already exists
TMUX_EXISTS=$(tmux ls | grep tenderduty | wc -l)

if [ "$TMUX_EXISTS" -eq "0" ]; then
    # Create a new tmux session in the background
    tmux new-session -d -s tenderduty
    echo "Tenderduty tmux session created."
else
    echo "Tenderduty tmux session already exists."
fi

# Ensure the tenderduty directory exists and enter it
mkdir -p tenderduty && cd tenderduty

# Check if config.yml already exists to avoid overwriting
if [ ! -f "config.yml" ]; then
    # Run Docker container to generate config.yml
    docker run --rm ghcr.io/blockpane/tenderduty:latest -example-config > config.yml
    echo "Tenderduty configuration file generated."
else
    echo "Tenderduty configuration file already exists."
fi
