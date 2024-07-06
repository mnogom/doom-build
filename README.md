# Big thanks to
* [DIEGO CRESPO](https://github.com/diego-crespo) for [article](https://www.deusinmachina.net/p/lets-compile-linux-doom)
* [Luke Leedy](https://github.com/lunkums) for [patch](https://github.com/lunkums/DOOM_fixed/tree/master)
* [jupemara](https://github.com/jupemara) for [example with x11vnc in docker](https://github.com/jupemara/x11vnc-docker)


# HOWTO
```bash
git clone https://github.com/mnogom/doom-build.git
cd doom-build
https://github.com/id-Software/DOOM.git
pushd DOOM
git checkout a77dfb9
popd
make run
```

Sources:
* https://en.wikipedia.org/wiki/Xvfb
* https://redos.red-soft.ru/base/server-configuring/remote-control/x11vnc/
* https://www.doomworld.com/forum/topic/115615-original-linuxdoom-in-8-bit-xsession-weird-color-glitch/
* https://github.com/Akbar30Bill/DOOM_wads

# TODO:
* remove .git from DOOM 
* move target build
* 