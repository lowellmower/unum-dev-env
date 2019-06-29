#!/bin/bash

export OPEN_WRT_DIR=home/vagrant/openwrt/
export ARM_CORTEX_MINIM_DIR=bin/packages/arm_cortex-a7_neon-vfpv4/minim/
export UNUM_IPK=unum_2019.2.0_arm_cortex-a7_neon-vfpv4.ipk
export UNUM_PKG=${OPEN_WRT_DIR}${ARM_CORTEX_MINIM_DIR}${UNUM_IPK}

# ensure all build deps are met and luxury packages are installed
apt-get update &&   \
apt-get install -y  \
    build-essential \
    gawk            \
    gettext         \
    git             \
    libncurses5-dev \
    libssl-dev      \
    libcurl3        \
    libjansson4     \
    swig            \
    sshpass         \
    time            \
    unzip           \
    zlib1g-dev

# clone openWrt, apply minim feed config, update and install
git clone https://github.com/openwrt/openwrt.git
cd openwrt
echo "src-git minim https://github.com/MinimSecure/minim-openwrt-feed" >> \
    feeds.config.default
./scripts/feeds update -a
./scripts/feeds install -a

# convenience commands
echo "alias ll='ls -la'" >> ~/.bashrc
echo "alias cp-ipk='scp $UNUM_PKG root@192.168.11.1:/tmp/'" >> ~/.bashrc
