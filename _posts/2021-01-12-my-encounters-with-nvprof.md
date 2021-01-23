---
layout: post
title: My encounters with nvprof metrics
date: 12-01-2021 01:58:18 +05:30
tags: [nvidia, cuda, nvprof]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

My objective is plain and simple. I wanted `nvprof` to output
the metrics as I had mentioned in [my gist](https://gist.github.com/mrprajesh/352cbe661ee27a6b4627ae72d89479e6)

We have two GPU P100 and GTX2080 which has 3 versions of CUDA installed: 8.0, 9.1 and 10.2 with driver 440.31.
We got some weird error which even google had no answers.


// TODO



## How did we fix it

- Installed Driver 440.33.01
- sudo with nvprof


