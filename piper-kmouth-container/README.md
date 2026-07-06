# KMouth-Piper Distrobox Container Setup

This directory contains everything needed to initialize and launch a completely self-contained **KMouth + Piper TTS** setup integrated via **Distrobox** (using a standard Fedora Toolbox image).
Distrobox handles host integration (D-Bus, graphics display, sound server, and home configuration directories) flawlessly, and all packages and configs are installed isolated within the container.

---

## Files in this Setup

* **`piper-generic.conf`**: Speech Dispatcher module routing engine setup to run Piper TTS at `22050` Hz sample rate.
* **`setup.sh`**: Automated shell script to create the `kmouth-piper-box` distrobox, install all required dependencies (Speech Dispatcher, KMouth, Breeze style plugins, Pip wheels, and voice models) step-by-step, configure them, and export the application launcher shortcut to your host.
* **`run.sh`**: Helper execution script that launches the KMouth application inside the container using Distrobox.

---

## How to Install

Simply open your terminal, navigate to this directory, and run the setup script:

```bash
cd ~/distrobox-containers/piper-kmouth-container
./setup.sh
```

Once completed:
1. **KMouth (kmouth-piper-box)** will be visible in your desktop environment's application launcher.
2. In KMouth's settings (**Settings** -> **Configure KMouth...** -> **Text-to-Speech**):
   * Select **`speechd`** as the backend plugin.
   * Choose **`en_US-amy-medium`** as the voice.

---

## How to Run manually

If you prefer to launch the application directly from the terminal:

```bash
~/distrobox-containers/piper-kmouth-container/run.sh
```

---

## How to Uninstall

If you ever want to completely remove this setup and all its files from your system, run:

```bash
# 1. Delete the distrobox container
distrobox rm -f kmouth-piper-box

# 2. Remove the source directory
rm -rf ~/distrobox-containers
```
