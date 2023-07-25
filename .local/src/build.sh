#!/bin/sh
# define make command
# "make" for just compiling,
# "sudo make install" to install

makecmd(){
sudo make install -j2
}

# Define where patches and configs are
PATCHES=patches
CONFIGS=configs

# dmenu
git clone https://git.suckless.org/dmenu
cp $CONFIGS/dmenu-config.h dmenu/config.h
cd dmenu 
makecmd
cd ..

# dwmblocks
git clone https://github.com/torrinfail/dwmblocks
cp $CONFIGS/dwmblocks-blocks.h dwmblocks/blocks.h
cd dwmblocks 
makecmd
cd ..

# dwm
git clone https://git.suckless.org/dwm
cp $PATCHES/dwm-* dwm
cp $CONFIGS/dwm-config.h dwm/config.h
cd dwm
patch -p1 < dwm-systray-6.4.diff
makecmd
cd ..

# st
git clone https://git.suckless.org/st
cp $PATCHES/st-* st
cp $CONFIGS/st-config.h st/config.h
cd st
patch -p1 < st-scrollback-0.8.5.diff
patch -p1 < st-anysize-0.8.4.diff
patch -p1 < st-alpha-20220206-0.8.5.diff
makecmd
cd ..

