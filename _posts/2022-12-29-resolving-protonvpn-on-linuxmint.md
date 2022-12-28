---
layout: post
title: Resolving ProtonVPN on linuxmint
date: 29-12-2022 01:52:22 +05:30
tags: [protonvpn, vpn, linuxmint, ubuntu]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

Despite following ProtonVPN's [official documentation](https://protonvpn.com/support/official-linux-vpn-mint/)
I want not able to make the GUI app working (loading forever and said Network issue detected or Network error.) whereas the `protonvpn-cli` worked right out of the box.
It turns out that it is due to some library mismatch but I couldn't fix. 

```c

SystemError: ffi_prep_closure(): bad user_data (it seems that the version  \
of the libffi library seen at runtime is different from the 'ffi.h'        \
file seen at compile-time)

```

I sought the help of the support team and it resolved the problem -- to remove some `cffi` packages.

```c

python3 -m pip uninstall cffi argon2-cffi  argon2-cffi-bindings

```

Let's blaster! :wink:
