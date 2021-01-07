# lichee-pi-docker-build

Set of tools to build filesystem image for Lichee Pi Zero and Nano 

## Filesystem image (buildroot)

As it well stated by good people under [this Hackaday post](https://hackaday.io/project/134065-funkey-zero/log/144796-linux-distribution), buildroot is capable to generate u-boot, kernel and root filesystem image and build a single SD Card image that contains them all at their expected location using a single command `make`. So they have prepared all necessary buildroot customizations in [gh://Squonk42/buildroot-licheepi-zero](https://github.com/Squonk42/buildroot-licheepi-zero) repo.

What I do here is prepare Docker build image and set of scripts to do reliable build whenever I need it, based on abowe repo.

Step are
1. `git submodule update` will pull linked repos into appropriate folders
1. Navigate to `./buildroot` folder. I recommend to open it in vscode, next steps will be executed as vscode tasks.
1. `build: build docker image` vscode task, this will build local image with all build tool required.
1. `build: autoconfig` vscode task will prepare .config file
1. `build: (optional) make menuconfig` vscode task will run visual editor for .config. Use it if you want to change build settings
1. `build: make` vscode task will run actual build. It takes some time. Output will be placed in `./buildroot-licheepi-zero/output` folder like this:
```
$ ls -alh buildroot-licheepi-zero/output/images/
total 95M
drwxr-xr-x 2 dronische dronische 4.0K Jan  7 20:34 .
drwxr-xr-x 6 dronische dronische 4.0K Jan  7 19:52 ..
-rw-r--r-- 1 dronische dronische  292 Jan  7 20:34 boot.scr
-rw-r--r-- 1 dronische dronische 8.0M Jan  7 20:34 boot.vfat
-rw-r--r-- 1 dronische dronische  60M Jan  7 20:34 rootfs.ext2
lrwxrwxrwx 1 dronische dronische   11 Jan  7 20:34 rootfs.ext4 -> rootfs.ext2
-rw-r--r-- 1 dronische dronische 8.6M Jan  7 20:34 rootfs.tar
-rw-r--r-- 1 dronische dronische  69M Jan  7 20:34 sdcard.img
-rw-r--r-- 1 dronische dronische  12K Jan  7 20:31 sun8i-v3s-licheepi-zero-dock.dtb
-rw-r--r-- 1 dronische dronische  11K Jan  7 20:31 sun8i-v3s-licheepi-zero.dtb
-rw-r--r-- 1 dronische dronische 384K Jan  7 20:33 u-boot-sunxi-with-spl.bin
-rw-r--r-- 1 dronische dronische 352K Jan  7 20:33 u-boot.bin
-rw-r--r-- 1 dronische dronische 3.9M Jan  7 20:31 zImage
```

Next we write image to sdcard:
```
$ dd if=sdcard.img bs=1M | pv | sudo dd of=/dev/sdc bs=1M
68+1 records in
68+1 records out
71827456 bytes (72 MB, 68 MiB) copied, 0,0686616 s, 1,0 GB/s
68,5MiB 0:00:00 [1013MiB/s] [ <=>                                                                             ]
0+617 records in
0+617 records out
71827456 bytes (72 MB, 68 MiB) copied, 15,8163 s, 4,5 MB/s
$ sudo sync
```
Now stick sdcard into the board, connect serial monitor and power it up. You will be greeted by login prompt in couple of seconds
Use `root` as login, `licheepi` as password.
```
...
[    1.580080] EXT4-fs (mmcblk0p2): re-mounted. Opts: data=ordered
[    1.921154] Generic PHY stmmac-0:01: attached PHY driver [Generic PHY] (mii_bus:phy_addr=stmmac-0:01, irq=POLL)
[    1.933339] dwmac-sun8i 1c30000.ethernet eth0: No MAC Management Counters available
[    1.941141] dwmac-sun8i 1c30000.ethernet eth0: PTP not supported by HW

Welcome to Buildroot for the LicheePi Zero
licheepi-zero login: root
Password: 
# ls -alh
total 3
drwx------    2 root     root        1.0K Jan  1 00:06 .
drwxr-xr-x   18 root     root        1.0K Jan  7  2021 ..
-rw-------    1 root     root          19 Jan  1 00:07 .ash_history
# 
```

## Das u-boot

Alternatively to method above you can use method described under [link](https://licheepizero.us/build--uboot-for-licheepi-zero) from [gh://Lichee-Pi/u-boot](https://github.com/Lichee-Pi/u-boot)

## Linux kernel

Alternatively to method above you can use method described under [link](https://licheepizero.us/build-kernel-for-licheepi-zero) from [gh://Lichee-Pi/linux](https://github.com/Lichee-Pi/linux) 

## Links

- [hackaday.io/project/134065-funkey-zero/log/144796-linux-distribution](https://hackaday.io/project/134065-funkey-zero/log/144796-linux-distribution)
- [licheepizero.us](https://licheepizero.us/)
- [licheezero docs](https://licheezero.readthedocs.io/zh/latest/)
- [licheezero Lichee-Pi repos](https://github.com/Lichee-Pi)
- [licheezero Zepan repos](https://github.com/Zepan/)
- [linux-sunxi wiki](http://linux-sunxi.org/LicheePi_Zero)
- [linux-sunxi repos](https://github.com/linux-sunxi)

