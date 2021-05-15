---
layout: post
title: bool in C language
date: 16-05-2021 00:01:01 +05:30
tags: [jekyll, coding]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

For long time I was under an impression that `bool` data type is present
only in C++ and not in C language. I just got to know that it is there
in C however it is not enabled default. So, we have to include it. It is
very surprising that it is present there from C99 standard.

```c
#include <stdio.h>
#include <stdbool.h>
int main(){
  bool a = true;
  printf("what's a? %d", a);
  return 0;
}

```
### Note

- Uninitialized bool defaults to `false`.
- There is **no** format specifier in printf to specify bool type.

### References

- [Wikibooks](https://en.wikibooks.org/wiki/C_Programming/stdbool.h)
- [SO](https://stackoverflow.com/a/17307307/2712045)

