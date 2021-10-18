---
layout: post
title: cpp loop fusion and fission
date: 18-10-2021 12:13:46 +05:30
tags: [cpp,cuda]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

After seeing the below tweet.

<blockquote class="twitter-tweet" data-theme="dark"><p lang="en" dir="ltr">IMO the two most important transformations for performant code are Array of Structs to Struct of Arrays and Loop Fusion to Loop Fission. The 1st is essential for cache perf and the 2nd breaks data dependencies and often unlocks more optimizations that were not obvious before. <a href="https://t.co/hjLvzusExz">pic.twitter.com/hjLvzusExz</a></p>&mdash; Daniel Holden (@anorangeduck) <a href="https://twitter.com/anorangeduck/status/1449420737895440393?ref_src=twsrc%5Etfw">October 16,
2021</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

This is super cool! I sense a lot of value for whoever using `Thurst` algorithms.
