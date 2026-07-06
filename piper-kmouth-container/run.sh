#!/bin/bash
set -euo pipefail

CONTAINER_NAME="kmouth-piper-box"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ensure_container_exists() {
    if ! distrobox list | grep -q "$CONTAINER_NAME"; then
        "$SCRIPT_DIR/setup.sh"
    fi
}

launch_kmouth() {
    distrobox enter "$CONTAINER_NAME" -- kmouth "$@"
}

main() {
    ensure_container_exists
    launch_kmouth "$@"
}

main "$@"
