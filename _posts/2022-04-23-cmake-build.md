---
layout: post
title: cmake build is easy now.
date: 23-04-2022 16:09:19 +05:30
tags: [cmake, coding]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---
Generally in many repo using `cmake`. We do the following
```c
git clone <repo>
cd <repo>
mkdir build
cd build
cmake .. # may be with more args. For now, KISS!
make
```
Now in the recent `cmake` version. We can do the last 4 steps in 2 lines.

```c
# starting with CMake 3.13, use a simpler form:
cmake -S . -B "build" # -DCMAKE_BUILD_TYPE=Release
# Build the library.
cmake --build "build" # --config Release
```
