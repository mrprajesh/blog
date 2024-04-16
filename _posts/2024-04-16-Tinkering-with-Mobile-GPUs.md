---
layout: post
title: Playing and tinkering with Mobile GPUs's tools
date: 16-04-2024 14:25:25 +05:30
tags: [qualcomm, adreno, snapdragon]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

These tools use android SDK's `adb` tool underneath. Create an account to grab the tools. 
Not much are available public to play around. However, one needs a Snapdragon/Adreno GPU to tinker with
Those are available for high-end mobiles only presently which I do not have.

```
- qualcomm 
1. profiler
2. SDK
 
$ sudo apt-get install libc++1
$ sudo apt-get install libc++abi1

$ sudo apt-get install openjdk-19-jdk
$ wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip

extact and add to path

https://www.mono-project.com/download/stable/#download-lin
// no avilable for 22.04, sad!
sudo apt install mono-complete

build from src https://www.mono-project.com/docs/compiling-mono/linux/#building-mono-from-a-release-package

PREFIX=/usr/local
VERSION=4.2.1
tar xvf mono-$VERSION.tar.xz
cd mono-$VERSION
./configure --prefix=$PREFIX
make
make install

Go to https://www.nuget.org/downloads and download the recommended version of nuget.exe under 
"Windows x86 Commandline" (this works with mono)
$ mono nuget.exe install gtksourcesharp -Version 3.24.24.38 -OutputDirectory ~/.local/share/SDP

```
Some tool which does not have linux support are run using wine-type environment from the windows exe files. That's wired!

update:20-Mar-2024, 14:35:07 IST
