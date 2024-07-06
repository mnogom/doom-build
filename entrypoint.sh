#!/usr/bin/bash

# ================= WORKING PART ===================
#Xvfb :99 -ac -listen tcp -screen 0 320x200x8 &
#sleep 3
#fluxbox -display :99 -screen 0 &
#sleep 3
#x11vnc -display :99.0 -forever
# ================= END WORKING PART ===============


# ================= WORKING PART ===================
xvfb-run -a --listen-tcp --server-args ":99 -ac -screen 0 320x200x8" ~/DOOM/linuxdoom-1.10/linux/linuxxdoom  &
sleep 3
fluxbox -display :99 -screen 0 &
sleep 3
x11vnc -display :99.0 -forever -flashcmap -shiftcmap -notruecolor # -nofb -visual TrueColor # -8to24
#sleep 7
## make screenshot
#xwd -display :99 -root -silent | convert xwd:- png:/output/screenshot.png
# ================= END WORKING PART ================
