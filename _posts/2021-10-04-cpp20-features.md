---
layout: post
title: cpp20 features
date: 04-10-2021 13:21:58 +05:30
tags: [c,cpp,tricks]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

With advent to range-based  for loop we begin to write the below loop
```c
for( int i=0; i < vec.size(); ++i){ //vec is just for sample
  // use vec[i]
}
```

as this one.

```c
for( auto v: vec){
  // use v
}
```

However at many time we also needed the index, we have do this dirty work.


```c
int index =0;
for( auto v: vec){
  // use v
  ++index;
}
```

But, we do not have to play on dirt now using `c++20` we can declare variable inside the range for loop. :)

```c
for(int index{0}; auto v: vec){
  // use v
  ++index;
}
```


### Refs

- [P0614R1](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2017/p0614r1.html)
