#!/usr/bin/bash

apt install -y xterm
Xvfb :99 -ac -listen tcp -screen 0 1024x768x8 &
fluxbox -display :99 -screen 0 &
x11vnc -display :99.0 -forever -flashcmap -shiftcmap -notruecolor