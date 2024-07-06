#!/usr/bin/bash

# ================= WORKING PART ===================
#Xvfb :99 -ac -listen tcp -screen 0 320x200x8 &
#sleep 3
#fluxbox -display :99 -screen 0 &
#sleep 3
#x11vnc -display :99.0 -forever
# ================= END WORKING PART ===============


# ================= WORKING PART ===================
mkdir ~/.fluxbox
echo "
session.screen0.toolbar.autoHide:       false
session.screen0.toolbar.visible:        false
session.screen0.tab.width:	0
session.screen0.tabs.intitlebar:	false
session.screen0.workspaces:	1
session.screen0.workspaceNames:	DOOM
session.ignoreBorder:	true
" > ~/.fluxbox/init

touch ~/.fluxbox/menu
touch ~/.fluxbox/keys
touch ~/.fluxbox/windowmenu

echo "
[app] (name=) (class=)
  [Deco]    {0x6}
  [Maximized]   {yes}
[end]
" > ~/.fluxbox/apps

xvfb-run -a --listen-tcp --server-args ":99 -ac -screen 0 320x200x8" ~/DOOM/linuxdoom-1.10/linux/linuxxdoom  &
sleep 3
fluxbox -display :99 -screen 0 &
sleep 3
x11vnc -display :99.0 -forever -flashcmap -shiftcmap -notruecolor # -nofb -visual TrueColor # -8to24
#sleep 7
## make screenshot
#xwd -display :99 -root -silent | convert xwd:- png:/output/screenshot.png
# ================= END WORKING PART ================

# x11vnc params
#-listen ipaddr         listen for connections only on network interface with
#                       addr ipaddr. '-listen localhost' and hostname work too.
#-listenv6 ipv6addr     listen for IPv6 connections only on network interface with
#                       addr ipv6addr. '-listen localhost' and hostname work too.

#sleep 3
#echo "==================================="
#xvfb-run --auto-servernum --server-num=1 x-terminal-emulator &
#echo "==================================="

#Xvfb :99 -ac -listen tcp -screen 0 320x200x8 &
#sleep 3
#./tinywm -display :99 -screen 0 &
#sleep 3
#x11vnc -display :99.0 -forever

#xvfb-run ./linuxdoom &
#sleep 3



#apt install libxcb-keysyms1-dev xcb
#git clone https://github.com/mcpcpc/xwm

#Xvfb :99 -ac -listen tcp -screen 0 320x200x8 &
#sleep 3
#fluxbox -display :99 -screen 0 & &
#sleep 3
#x-terminal-emulator &
#sleep 3
#~/DOOM/linuxdoom-1.10/linux/linuxxdoom &
#x11vnc -display :99.0 -forever



#06/07/2024 14:44:08 Pixel format for client 192.168.65.1:
#06/07/2024 14:44:08   32 bpp, depth 24, little endian
#06/07/2024 14:44:08   true colour: max r 255 g 255 b 255, shift r 16 g 8 b 0