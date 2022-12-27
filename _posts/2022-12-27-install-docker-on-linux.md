---
layout: post
title: How to Install Docker on Linux Mint or Ubuntu
date: 27-12-2022 16:32:32 +05:30
tags: [docker, ubuntu, linuxmint]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

## Requirements
- Tested on Ubuntu 20.04

## Steps for Installation.

```c
# Prereq
# Step 0 & 1
$ sudo apt-get update
$ sudo apt-get install ca-certificates curl gnupg lsb-release

# Step 2. keyring
$ sudo mkdir -p /etc/apt/keyrings
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Step. 3.A if Ubuntu
$ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Step. 3.B if Linux Mint 20.3. Note added "focal"  
$ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  focal stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

################################  
# Step 4. Install Docker
################################  
sudo apt-get update  
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin  
```


## Testing Installation

If docker is installed fine, it should display as below.

```c
sudo docker run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/

```

### Reference
- [Docker Official Guide](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)
