---
layout: post
title: Thinks To Note in C Language
date: 19-06-2021 17:08:54 +05:30
tags: [c, programming,teaching,ta]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

Back in those days as I started as a teaching assistant (TA) we TAs would
learn things which we never knew before. I am going add few things that I
have learnt in TAing CS1111 this semester Apr-Jun 2021.

- `" %c"` the space before the %c matters! it prevents storing white space char.
> Otherwise it might consume the white space chars (such as `' ', '\t','\n'`) of the previous input
> eg `scanf("%d%c", num, ch)` taking input "11 a" implies `num=11` and `ch=' '` i.e a space in `ch` instead of intended `a`

- `n=2i` assignment is valid in C because the newer compilers have a complex constants as well.
```c
#include <stdio.h>
int main(){
  int j=0;
  int k=3i;
  printf("i=%d k=%d",j,k);
  for(j=0; j<k; ++k)
    printf("j=%d\n",j);
  return 0;
}
```
> So, this will not result in a compiler error as `i` undefined.

- `clang` and `gcc` may produce different output on using of uninitialized variables. One defaults to zero and other uses garbage value.
- We used [Replit.com](replit.com) to running our labs. It can very much simulate a TA monitoring the students while coding. More about replt later.
- Never assign 0 to char in the char array and print it. It will either not print or have trouble with the output.
- Usage of bitwise-operator to make string of chars turn into: lower-case, upper-case and flip cases.
