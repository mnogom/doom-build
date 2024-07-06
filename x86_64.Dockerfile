FROM debian:12.6-slim
LABEL authors="konstantinfreidlin"

SHELL [ "/bin/bash", "-c" ]
ENV DOOMVADOOMWADDIR="/root/DOOM/linuxdoom-1.10/linux/doom1.wad"

# install dependencies
RUN apt update; apt upgrade && \
    apt install -y make gcc libx11-dev libxtst-dev git xvfb fluxbox x11vnc xterm

# build DOOM
COPY ./DOOM /root/DOOM
COPY doom.conf.d/DOOM-lunkums.patch /root/DOOM/DOOM-lunkums.patch
RUN pushd /root/DOOM && \
    git apply DOOM-lunkums.patch && \
    popd && \
    pushd /root/DOOM/linuxdoom-1.10 && \
    make && \
    popd
#    pushd /root/DOOM/sndserv && \
#    make && \
#    cp linux/sndserver /root/DOOM/linuxdoom-1.10/linux/ && \
#    popd

COPY doom.conf.d/doom1.wad /root/DOOM/linuxdoom-1.10/linux/doom1.wad

WORKDIR /root/DOOM/linuxdoom-1.10/linux

COPY ./entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]

# xrandr
# xdpyinfo

#    apt install -y make gcc libx11-dev \
#        x11-xserver-utils libxtst-dev xserver-xorg-video-dummy \
#        lightdm git python3 python3-setuptools python3-distro wget && \
#    git clone https://github.com/Xpra-org/xpra && \
#    pushd xpra && \
#    ./setup.py install-repo && \
#    popd

#Xvfb :99 -ac -listen tcp -screen 0 640x480x8 &
#sleep 3
#/usr/bin/fluxbox -display :99 -screen 0 &
#sleep 3
#xvfb-run ./linuxdoom &
#sleep 3
#x11vnc -display :99.0 -forever