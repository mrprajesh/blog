---
layout: post
title: How To Install CUDA 13 On Ubuntu 22.04 Linux Mint21.3
date: 12-08-2025 22:14:15 +05:30
tags: [cuda, gpu]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---
As I wanted to learn/try out the Tile Programming (which might be the future of MatMul Accelaration!). CuTe DSL and CUTLASS. I wanted to have CUDA 13 installed. 
I have installed on top my cuda 12 version which I [installed previously.](https://mrprajesh.co.in/blog/how-to-install-cuda-ubuntu-22-04.html)
1. In grub press e and type `nomodeset` before `quite splash` //unsure
2. `sudo service lightdm stop`
3. `wget https://developer.download.nvidia.com/compute/cuda/13.0.0/local_installers/cuda_13.0.0_580.65.06_linux.run`
4. `sudo sh cuda_13.0.0_580.65.06_linux.run`
5. ACCEPT. Untick driver and docs. Tick tool kit.
8. Unpon success. reboot.
9. Append in `~/.bashrc`
```c
export PATH=/usr/local/cuda-13.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-13.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
```

ok, More CuTe Examples later. 
Cheers :)
