---
layout: post
title: How to write bikeshed - Sample
date: 30-03-2020 13:59:10 +05:30
tags: [docs, bikeshed]
description:
summary:
comments: false
author: Rajesh Pandian M
---

### Install
As installed required Py3.7, decided not to install locally.

### Curl + Online

**3 Steps** Let us create Makefile and sample.bs which generates HTML file!

<pre>
bikeshed/
├── build
│   └── sample.html
├── Makefile
└── sample.bs
</pre>

#### Step 1
`Makefile` contents. [Thanks](1) Bryce.

<pre>

BUILDDIR = build

all: remote

setup:
	mkdir -p $(BUILDDIR)/

remote: setup
	find . -maxdepth 1 -name "*.bs" -type f | sed 's/\.bs$$//' | xargs -I{} -t -n 1 sh -c "curl https://api.csswg.org/bikeshed/ -F force=1 -F file=@{}.bs > $(BUILDDIR)/\`basename {}\`.html"

local: setup
	find . -maxdepth 1 -name "*.bs" -type f | sed 's/\.bs$$//' | xargs -I{} -t -n 1 sh -c "bikeshed -f spec {}.bs $(BUILDDIR)/\`basename {}\`.html"

clean:
	rm $(BUILDDIR)/*
	rmdir $(BUILDDIR)

</pre>



#### Step 2
`sample.bs` contents. Thanks to quick start [guide](2).

<pre>
<pre class='metadata'>
Title: Your Spec Title
Shortname: your-spec
Level: 1
Status: ED
Group: WGNAMEORWHATEVER
URL: http://example.com/url-this-spec-will-live-at
Editor: Your Name, Your Company http://example.com/your-company, your-email@example.com, http://example.com/your-personal-website
Abstract: A short description of your spec, one or two sentences.
</pre>

Introduction {#intro}
=====================

Introduction here.
</pre>

#### Step 3

Run `make` and open your `build/*.html` file in browser to view it. Yay!

[1]: https://github.com/brycelelbach/wg21_p2145_evolving_cpp_remotely/blob/master/Makefile
[2]: https://github.com/tabatkins/bikeshed/blob/master/docs/quick-start.md#starting-the-spec
