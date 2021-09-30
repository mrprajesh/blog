---
layout: post
title: Creating Good Images for research papers
date: 30-09-2021 12:40:41 +05:30
tags: [research,latex,writeup]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

It is a 3-step process I follow from [Sparsh Mittal](http://faculty.iitr.ac.in/~sparshfec/)
's talk.

1. Create Images using Open office Impress from a blank presentation.
	- // We can use shapes, or other images.
	- // We can use Text/Arrows/anything.
2. Export as PDF.
3. Use `pdfcrop sample.pdf` to crop the extra white spaces around and directly include cropped file in begin figure on latex.


PS: We can do the same for `Openoffice Calc` figures by exporting as `.eps` format.

### Prerequsites

- Need Open or Libre office which is a FOSS.
- `pdfcrop` which you could install using apt-get commands

```c
sudo apt-get install texlive-extra-utils
```
