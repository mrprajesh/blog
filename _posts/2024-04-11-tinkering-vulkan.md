---
layout: post
title: Tinkering With HelloWorld Vulkan!
date: 11-04-2024 01:01:31 +05:30
tags: [vulkan]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

While I could have installed a vulkan SDK with just one `apt get install vulkan-sdk` 
command from the terminal, I somehow went for build from the [source](https://vulkan.lunarg.com/sdk/home).

```shell
# https://vulkan.lunarg.com/doc/view/latest/linux/getting_started_ubuntu.html#ubuntu-2204-jammy-jellyfish
wget -qO- https://packages.lunarg.com/lunarg-signing-key-pub.asc | sudo tee /etc/apt/trusted.gpg.d/lunarg.asc
sudo wget -qO /etc/apt/sources.list.d/lunarg-vulkan-jammy.list http://packages.lunarg.com/vulkan/lunarg-vulkan-jammy.list
sudo apt update
sudo apt install vulkan-sdk

## TO VERIFY
vkvia
vulkaninfo
vkcube

## had to do this 

sudo apt-get install libxrandr-dev python-is-python3 libwayland-dev #xorg-all?

# MINE WAS LINUX MINT SO KIND OF HACKED SCRIPT TO MAKE WORK FROM UBUNTU 22.04

sudo apt-get install libglm-dev cmake libxcb-dri3-0 libxcb-present0 libpciaccess0 \
             libpng-dev libxcb-keysyms1-dev libxcb-dri3-dev libx11-dev g++ gcc \
             libwayland-dev libxrandr-dev libxcb-randr0-dev libxcb-ewmh-dev \
             git python-is-python3 bison libx11-xcb-dev liblz4-dev libzstd-dev python3-distutils \
             ocaml-core ninja-build pkg-config libxml2-dev wayland-protocols python3-jsonschema
 
```

