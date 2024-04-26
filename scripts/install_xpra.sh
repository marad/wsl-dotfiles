#!/bin/bash

sudo wget -O /etc/apt/sources.list.d/xpra.list https://xpra.org/repos/jammy/xpra.list
sudo wget -O "/usr/share/keyrings/xpra.asc" https://xpra.org/xpra.asc
sudo apt update
sudo apt install -y xpra
sudo apt install -y libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio
sudo usermod -a -G xpra marad
