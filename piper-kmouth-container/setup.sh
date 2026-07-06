#!/bin/bash
set -e

# Setup script for building and initializing the kmouth-piper container (Distrobox method)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=================================================="
echo " Building local container image 'kmouth-piper'... "
echo "=================================================="
podman build -t kmouth-piper "$SCRIPT_DIR"

echo ""
echo "=================================================="
echo " Initializing Distrobox 'kmouth-piper-box'... "
echo "=================================================="

# Check and remove old distrobox if it exists
if distrobox list | grep -q "kmouth-piper-box"; then
    echo "Removing existing distrobox 'kmouth-piper-box'..."
    distrobox rm -f kmouth-piper-box
fi

# Create distrobox using our custom image
distrobox create --name kmouth-piper-box --image localhost/kmouth-piper:latest --yes

# Give Podman a moment to register container state
sleep 2

# Export KMouth from the distrobox to the host system
echo ""
echo "=================================================="
echo " Exporting KMouth application to host... "
echo "=================================================="
distrobox enter kmouth-piper-box -T -- distrobox-export --app kmouth

echo ""
echo "=================================================="
echo " Setup complete! "
echo " You can now launch KMouth from your host's "
echo " application menu or by running: "
echo "   ~/distrobox-containers/piper-kmouth-container/run.sh "
echo "=================================================="
