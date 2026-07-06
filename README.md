# Distrobox Containers & Configurations

This repository is a collection of my custom, self-contained container configurations and helper scripts running via **Distrobox**. These setups provide desktop integration (D-Bus, audio, and graphics) while keeping application dependencies isolated from the host system.

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

## Configuration & Usage

After initializing a container, configure the application settings as follows:

### KMouth + Piper TTS Configuration
1. Launch **KMouth** from your host's application launcher.
2. Open configuration via **Settings** -> **Configure KMouth...** -> **Text-to-Speech**.
3. Select **`speechd`** as the Text-to-Speech engine / backend.
4. Select **`en_US-amy-medium`** as the default voice.

