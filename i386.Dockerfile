FROM i386/debian:12.6-slim
LABEL authors="konstantinfreidlin"

SHELL [ "/bin/bash", "-c" ]
ENV DOOMVADOOMWADDIR="/root/DOOM/linuxdoom-1.10/linux/doom1.wad"

RUN apt update; apt upgrade && \
    apt install -y make gcc libx11-dev libxtst-dev git

# build DOOM
COPY ./DOOM /root/DOOM
COPY conf-doom/DOOM-lunkums.patch /root/DOOM/DOOM-lunkums.patch
COPY conf-doom/doom1.wad /root/DOOM/linuxdoom-1.10/linux/doom1.wad
RUN pushd /root/DOOM && \
    git apply DOOM-lunkums.patch && \
    popd && \
    pushd /root/DOOM/linuxdoom-1.10 && \
    make x86 && \
    popd && \
    pushd /root/DOOM/sndserv && \
    make x86 && \
    cp linux/sndserver /root/DOOM/linuxdoom-1.10/linux/ && \
    popd

WORKDIR /root/DOOM/linuxdoom-1.10/linux

ENTRYPOINT [ "/bin/bash" ]
