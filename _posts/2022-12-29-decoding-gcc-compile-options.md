---
layout: post
title: Decoding gcc compile options
date: 29-12-2022 03:55:04 +05:30
tags: [gcc]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

GCC/G++ has wide variety of options.


Most used options.
```c
-c    // just complie to .o file
-o    // name of the executable
-Wall // display all warnings
-lm   // link math lib
```

- `.a` static library
- `.so` shared object/(dynamic) library
- `.o` object file

More advanced options

```c
-shared -o libfoo.so 
-lfoo
-I     // Checks for dir of the include headers in addtion to default
-L     // checks for lib dir for libraries (in addtion to default) at link time
-rpath // checks for lib dir for libraries (in addtion to default) at run  time
```


```c
readelf -d libfoobar.so
 0x0000000000000001 (NEEDED)             Shared library: [libfoo.so]
 0x0000000000000001 (NEEDED)             Shared library: [libbar.so]

readelf -d prog 
 0x0000000000000001 (NEEDED)             Shared library: [libfoobar.so]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
 0x000000000000001d (RUNPATH)            Library runpath: [.]

strings /usr/lib/x86_64-linux-gnu/libstdc++.so.6 | grep GLIBCXX
GLIBCXX_3.4
GLIBCXX_3.4.1
..
GLIBCXX_3.4.29
GLIBCXX_DEBUG_MESSAGE_LENGTH


```
<script src="https://gist.github.com/mrprajesh/4229185c0047d5d165480d82866c6037.js"></script>
