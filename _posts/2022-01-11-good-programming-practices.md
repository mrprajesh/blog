---
layout: post
title: Good programming practices
date: 11-01-2022 13:39:09 +05:30
tags: [cpp, coding]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

Okay, let's reiterate it again.

### Good (for me!) programming practices (esp. #c++ #cpp or #cplusplus)

Every wonder why I have the same language name written in three different ways.


- **1-3**: Editor setup
- **4-9**: C++
- **14-15**: Git

1. Have a snipets for `cpp` or `c` starting template. i.e. I type cpp [HIT TAB] to get main function.
2. Have a snippet for autocompleting `std::` . e.g `cout` or `vector` [TAB].
3. Have a two space for tab. Why? deeper nesting will look back if `tab` or `4 spaces` is used.
4. filenames: put it meaniful. I prefer `hypen`  over `underscore` if `camelcase` is not allowed.
5. variable and functionNames: Begin with a lower-case and camel-case if more words. functionName will have a verb in it.
6. ClassName: Singular and begin with a upper-case.
7. CONSTANTS: Use all upper-case letters. so as enums
8. Use a good option (say `-d`) to print debug info than meare print statements which require (un)commenting every time.
9. If the program, is going to be used less (2 days or lesser) and needs quick run, you may use `using namespace std;` and `#include <bits/stdc++.h>`
10. If the program, is going to be a library or some large project might use it in future, then ignore the above suggestion.
11. Make sure every chunck (block or few lines) of the code you write is compile-able. DO NOT write and fix bug.
12. Comment the non-obvious items. Possible exceptions that you missed and change log.
13. Add compilation (or/and execution) commands at the top of the file if it is unusual
14. Use `git` or `GitHub` to track the issues, ideas and progress.
15. Use your own file version numbering if `git` is inapproriate.


// TODO

