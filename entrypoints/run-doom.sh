#!/usr/bin/bash

xvfb-run -a --listen-tcp --server-args ":99 -ac -screen 0 320x200x8" ~/DOOM/linuxdoom-1.10/linux/linuxxdoom  &
fluxbox -display :99 -screen 0 &
x11vnc -display :99.0 -forever -flashcmap -shiftcmap -notruecolor
#sleep 7
# make screenshot
# xwd -display :99 -root -silent | convert xwd:- png:/output/screenshot.png
