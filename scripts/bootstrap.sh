#!/bin/bash

apt-get update &&   \
apt-get install -y  \
    build-essential \
    libncurses5-dev \
    gawk            \
    git             \
    libssl-dev      \
    gettext         \
    swig            \
    time            \
    unzip           \
    zlib1g-dev
