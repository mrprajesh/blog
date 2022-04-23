---
layout: post
title: building and install gcc from source on linux
date: 23-03-2022 02:59:27 +05:30
tags: [gcc,c,cpp,c++,install]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

1. Go to [GNU site](https://ftp.gnu.org/gnu/gcc/) download the required file.
2. Let's see how to install gcc-5.4.0.tar.gz

```c

## Download and extract
wget https://ftp.gnu.org/gnu/gcc/gcc-5.4.0/gcc-5.4.0.tar.gz --no-check-certificate
tar -xvzf gcc-5.4.0.tar.gz

## dowloads prereq
cd gcc-5.4.0
./contrib/download_prerequisites

## configure Build
cd /tmp
mkdir gcc54-build
cd gcc54-build/

## change arg0 and prefix to approp locations
~/install/gcc-5.4.0/configure -v --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu --prefix=/lfs/usrhome/phd/cs16d003/install/gcc54 --enable-checking=release --enable-languages=c,c++,fortran --disable-multilib --program-suffix=-5.4
# note --prefix=/usr/bin/gcc


make -j 32 # or based on number of cpus
make install
```


```c
----------------------------------------------------------------------
Libraries have been installed in:
   /lfs/usrhome/phd/cs16d003/install/gcc54/lib/../lib64

If you ever happen to want to link against installed libraries
in a given directory, LIBDIR, you must either use libtool, and
specify the full pathname of the library, or use the `-LLIBDIR'
flag during linking and do at least one of the following:
   - add LIBDIR to the `LD_LIBRARY_PATH' environment variable
     during execution
   - add LIBDIR to the `LD_RUN_PATH' environment variable
     during linking
   - use the `-Wl,-rpath -Wl,LIBDIR' linker flag
   - have your system administrator add LIBDIR to `/etc/ld.so.conf'

See any operating system documentation about shared libraries for
more information, such as the ld(1) and ld.so(8) manual pages.
----------------------------------------------------------------------

```

## Refs

- [Sorush](https://iamsorush.com/posts/build-gcc11/)
