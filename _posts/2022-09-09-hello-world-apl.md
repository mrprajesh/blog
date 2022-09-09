---
layout: post
title: Hello world APL language
date: 09-09-2022 16:56:02 +05:30
tags: [APL, coding]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

1. Download [Dyalog](https://www.dyalog.com/download-zone.htm) from here with email (SERIALNUMBER will be sent to your email).
2. As mentioned in [here](https://help.dyalog.com/latest/Content/UNIX_IUG/Dyalog%20Serial%20Number.htm)

      ```c
      # install dependencies
      sudo apt install libncurses5

      # Add you serial number to this file.
      vim $HOME/.dyalog/serial

      ```
3. Download and install RIDE [package](https://github.com/Dyalog/ride/releases) 
4. Run from installed programs. Look for Dyalog APL (not Dyalog APL TTY)  or run the below.

      ```c
         env RIDE_SPAWN=/usr/bin/dyalog /usr/bin/ride-4.4
      ```

## Hello World

- type tick i.e. ~ without shift. It means [iota](https://en.cppreference.com/w/cpp/algorithm/iota). Infact, C++ got that name from APL.

```c
`i 10

# displays 1 to 10 both inclusive.

⍳ 10
1 2 3 4 5 6 7 8 9 10

# this is reduce operation
      +/⍳10
55

# this is a scan operation.

      +\⍳ 10
1 3 6 10 15 21 28 36 45 55

``` 

## Online on a browser

- [https://tryapl.org/](https://tryapl.org/)


## Gettting started.

- [https://www.dyalog.com/getting-started.htm](https://www.dyalog.com/getting-started.htm)
- [Mastering APL](https://www.dyalog.com/uploads/documents/MasteringDyalogAPL.pdf)


## My Vision 

> If you can think in APL for your program, you can write better parallel codes in OMP or CUDA.

