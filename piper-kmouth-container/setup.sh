#!/bin/bash
set -euo pipefail

CONTAINER_NAME="kmouth-piper-box"
IMAGE_NAME="kmouth-piper"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

check_prereqs() {
    local cmd
    for cmd in podman distrobox; do
        if ! command -v "$cmd" &>/dev/null; then
            echo "Error: '$cmd' is required but not installed." >&2
            exit 1
        fi
    done
}

build_image() {
    podman build -t "$IMAGE_NAME" "$SCRIPT_DIR"
}

create_distrobox() {
    if distrobox list | grep -q "$CONTAINER_NAME"; then
        distrobox rm -f "$CONTAINER_NAME"
    fi
    distrobox create --name "$CONTAINER_NAME" --image "localhost/${IMAGE_NAME}:latest" --yes
}

export_app() {
    distrobox enter "$CONTAINER_NAME" -T -- distrobox-export --app kmouth
}

main() {
    check_prereqs
    build_image
    create_distrobox
    export_app
}

main "$@"
