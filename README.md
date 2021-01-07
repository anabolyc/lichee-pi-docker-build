# lichee-pi-docker-build

Set of tools to build filesystem image for Lichee Pi Zero and Nano 

## Filesystem image (buildroot)

As it well stated by good people under [this Hackaday post](https://hackaday.io/project/134065-funkey-zero/log/144796-linux-distribution), buildroot is capable to generate u-boot, kernel and root filesystem image and build a single SD Card image that contains them all at their expected location using a single command `make`. so thay prepared all necessary changes in [gh://Squonk42/buildroot-licheepi-zero](https://github.com/Squonk42/buildroot-licheepi-zero) repo.

What I do here is prepare Docker build image and set of scripts to do reliable build whenever I need it.

Step are
1. `git submodule update` will pull linked repos into appropriate folders
1. Navigate to `./buildroot` folder. I recommend to open it in vscode, next steps will be executed as vscode tasks.
1. `build: build docker image` vscode task, this will build local image with all build tool required.
1. `build: autoconfig` vscode task will prepare .config file
1. `build: (optional) make menuconfig` vscode task will run visual editor for .config. Use it if you want to change build settings
1. `build: make` vscode task will run actual build. It takes some time. Output will be placed in `./buildroot-licheepi-zero/output` folder like this:
```

```

## Das u-boot

Alternatively to method above you can use method described under [link](https://licheepizero.us/build--uboot-for-licheepi-zero) from [gh://Lichee-Pi/u-boot](https://github.com/Lichee-Pi/u-boot)

## Linux kernel

Alternatively to method above you can use method described under [link](https://licheepizero.us/build-kernel-for-licheepi-zero) from [gh://Lichee-Pi/linux](https://github.com/Lichee-Pi/linux) 

## Links

[licheepizero.us](https://licheepizero.us/)
[hackaday.io/project/134065-funkey-zero/log/144796-linux-distribution](https://hackaday.io/project/134065-funkey-zero/log/144796-linux-distribution)

