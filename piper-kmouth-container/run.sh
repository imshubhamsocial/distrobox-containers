#!/bin/bash
# Launcher script to run the kmouth-piper container inside Distrobox
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if distrobox exists, initialize if not
if ! distrobox list | grep -q "kmouth-piper-box"; then
    echo "Distrobox 'kmouth-piper-box' not found. Initializing setup..."
    "$SCRIPT_DIR/setup.sh"
fi

echo "Launching KMouth inside Distrobox..."
distrobox enter kmouth-piper-box -- kmouth "$@"
