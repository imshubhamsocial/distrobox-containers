# Distrobox Containers & Configurations

This repository is a collection of my custom, self-contained container configurations and helper scripts running via **Distrobox**. These setups provide desktop integration (D-Bus, audio, and graphics) while keeping application dependencies isolated from the host system.

## Table of Contents

- [Containers List](#containers-list)
- [Setup & Prerequisites](#setup--prerequisites)

## Containers list

| Directory | Container Name | Base Image | Description |
|---|---|---|---|
| [piper-kmouth-container](./piper-kmouth-container) | `kmouth-piper-box` | Fedora Toolbox | **KMouth** + **Piper TTS** reader setup, configured with the high-quality Amy medium voice. |

---

## Setup & Prerequisites

Make sure you have `distrobox` and `podman` (or `docker`) installed on your host system:

```bash
# Fedora / RHEL
sudo dnf install distrobox podman -y

# Ubuntu / Debian
sudo apt install distrobox podman -y
```

Navigate to any container folder and follow its specific README to build and run the container.
