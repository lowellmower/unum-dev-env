## Unum Development Environment
This repo is for building the [unum-sdk]() using vagrant and for a central
place to gather notes, learnings, and helpful information so you too can do
cool things with their software.

## Prerequisites
- [Vagrant]()
- [VirtualBox]()
- [Coffee](), or your vice of choice.

## Build the Environment
```
[local]$: git clone
[local]$: cd unum-dev-env
[unum-dev-env]$: vagrant up
[unum-dev-env]$: vagrant ssh
[vagrant@stretch]$:
```

## Build the World (openWRT)
Steps for building the whole 'kit-in-kaboodle', i.e. build openWrt and include
the unum agent.
```
# More soon... (20190628)
```

## Build the Agent (unum)
```
# More soon... (20190628)
vagrant@stretch:~/openwrt-18.06.3$ make UNUM_DEBUG=1 MODEL=openwrt_generic V=s package/unum/compile
```

## Helpful Commands
```
# from within this repo root, set the root user ssh password in an
# environment variable and exec the following and ctl+v when prompted

[unum-dev-env]: export UNUM_DEBUG_IPK=unum_2019.2.0_arm_cortex-a7_neon-vfpv4-debug.ipk
[unum-dev-env]: export ROOT_SSH_PASS=fooBarBaz
[unum-dev-env]: echo ${ROOT_SSH_PASS} | pbcopy &&                                            \
scp -i .vagrant/machines/default/virtualbox/private_key -P 2201                              \
vagrant@127.0.0.1:/home/vagrant/openwrt-18.06.3/bin/packages/arm_cortex-a7_neon-vfpv4/minim/ \
unum_2019.2.0_arm_cortex-a7_neon-vfpv4.ipk ./${UNUM_DEBUG_IPK} &&                            \
scp ${UNUM_DEBUG_IPK} root@192.168.11.1:/tmp/
```
