# KMouth-Piper Distrobox Container Setup

This directory contains the files needed to build and launch a completely self-contained **KMouth + Piper TTS** setup integrated via **Distrobox** (using a Fedora Toolbox image as the base).

Distrobox handles host integration (D-Bus, graphics display, sound server, and home configuration directories) seamlessly, and all packages and configs are installed isolated within the container.

## Table of Contents

- [Files in this Setup](#files-in-this-setup)
- [How to Install and Run](#how-to-install-and-run)
- [Run manually (Terminal)](#run-manually-terminal)
- [How to Uninstall](#how-to-uninstall)

---

## Files in this Setup

* **[Containerfile](file:///var/home/imshubhamsocial/distrobox-containers/piper-kmouth-container/Containerfile)**: Podman build recipe defining the container image.
* **[packages](file:///var/home/imshubhamsocial/distrobox-containers/piper-kmouth-container/packages)**: List of Fedora packages installed inside the container.
* **[piper-generic.conf](file:///var/home/imshubhamsocial/distrobox-containers/piper-kmouth-container/piper-generic.conf)**: Speech Dispatcher module routing engine setup to run Piper TTS at `22050` Hz sample rate.

---

## How to Install and Run

### 1. Build the Podman Image
From this directory, run:
```bash
podman build -t kmouth-piper .
```

### 2. Create the Distrobox Container
Create the container using the newly built image:
```bash
distrobox create --name kmouth-piper-box --image localhost/kmouth-piper:latest --yes
```

### 3. Export KMouth to the Host
Export the KMouth application to the host launcher/desktop menu:
```bash
distrobox enter kmouth-piper-box -T -- distrobox-export --app kmouth
```

Once completed:
1. **KMouth (kmouth-piper-box)** will be visible in your desktop environment's application launcher.
2. In KMouth's settings (**Settings** -> **Configure KMouth...** -> **Text-to-Speech**):
   * Select **`speechd`** as the backend plugin.
   * Choose **`en_US-amy-medium`** as the voice.

---

## Run manually (Terminal)

If you prefer to launch KMouth directly from your terminal:
```bash
distrobox enter kmouth-piper-box -- kmouth
```

---

## How to Uninstall

To completely remove the setup:

1. **Remove the application shortcut from host:**
   ```bash
   distrobox enter kmouth-piper-box -T -- distrobox-export --app kmouth --delete
   ```
2. **Remove the distrobox container:**
   ```bash
   distrobox rm -f kmouth-piper-box
   ```
3. **Remove the built image:**
   ```bash
   podman rmi localhost/kmouth-piper:latest
   ```
4. **Remove KMouth configuration and data files from host:**
   ```bash
   rm -f ~/.config/kmouthrc
   rm -rf ~/.local/share/kmouth/
   rm -f ~/.local/share/applications/kmouth-piper-box*
   ```
