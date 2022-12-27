---
layout: post
title: Dockering Jupyter notebook for cpp
date: 27-12-2022 16:55:01 +05:30
tags: [cpp, jupyter, docker]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---
In continuation to my earlier post about [running C++ Programs on Jypyter notebook](https://mrprajesh.co.in/blog/how-to-run-cpp-on-jupyter-notebook.html).
I just docker-ed those steps using my [Github Repo](https://github.com/mrprajesh/jupyter-for-cpp). Cool! 
:sunglasses:
                           
We use `docker` :heart: to install `xeus-cling` underneath. Thanks to [xeus-cling!](https://github.com/jupyter-xeus/xeus-cling)

## Reqirements
- Docker v20+ // [My Docker Installation Post](https://mrprajesh.co.in/blog/install-docker-on-linux.html)
- Diskspace upto 5 GB.
- Tested Ubuntu 20.04/Mint 20.3. Docker 20.10.22. Should work on similar OS or better.

```c
# Get my repo.
git clone https://github.com/mrprajesh/jupyter-for-cpp.git
cd jupyter-for-cpp

# Build. Get some Coffee!☕☕☕
$ sudo docker build -t test:latest .  

# Run
$ sudo docker run -p 8888:8888 test:latest

# open browser on the host machine: http://127.0.0.1:8888
# You may run the last cell to see the output! 
```

This understanding helped a lot. I can now docker my artifact of our papers.
Let's docker!  :cowboy_hat_face:
