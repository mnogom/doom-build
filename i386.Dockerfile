FROM i386/debian:12.6-slim
LABEL authors="konstantinfreidlin"

SHELL [ "/bin/bash", "-c" ]
ENV DOOMVADOOMWADDIR="/root/DOOM/linuxdoom-1.10/linux/doom1.wad"

RUN apt update; apt upgrade && \
    apt install -y make gcc libx11-dev:i386 libxtst-dev:i386 libxext-dev:i386 git xvfb fluxbox x11vnc

# for making screenshots
RUN apt install -y imagemagick x11-apps

# setup fluxbox
COPY fluxbox.conf.d /root/.fluxbox

# build DOOM
COPY ./DOOM /root/DOOM
COPY doom.conf.d/DOOM-lunkums.patch /root/DOOM/DOOM-lunkums.patch
RUN pushd /root/DOOM && \
    git apply DOOM-lunkums.patch && \
    popd && \
    pushd /root/DOOM/linuxdoom-1.10 && \
    make x86 && \
    popd
#    pushd /root/DOOM/sndserv && \
#    make x86 && \
#    cp linux/sndserver /root/DOOM/linuxdoom-1.10/linux/ && \
#    popd
COPY doom.conf.d/doom1.wad /root/DOOM/linuxdoom-1.10/linux/doom1.wad
WORKDIR /root/DOOM/linuxdoom-1.10/linux

COPY ./entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
#ENTRYPOINT [ "/bin/bash" ]
