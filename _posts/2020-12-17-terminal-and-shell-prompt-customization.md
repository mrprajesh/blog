---
layout: post
title: Terminal and shell prompt customization
date: 17-12-2020 13:40:46 +05:30
tags: [linux, shell, powerline]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---

Do you want your terminal prompt to look like a pro?

![sample pic! Not loaded](images/terminal.png)

### Installation steps.

1.  Install [powerline-shell](https://github.com/b-ryan/powerline-shell)
 through `pip install powerline-shell`
2.  Append below contents to the end of `~/.bashrc` file.
```c
function _update_ps1() {
    PS1=$(powerline-shell $?)
}
if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
```
3. Restart terminal using `source ~/.bashrc`

### Custom

```c
$ mkdir -p ~/.config/powerline-shell && \
powerline-shell --generate-config > ~/.config/powerline-shell/config.json
```

Edit this file as mine below!
```c
{
  "segments": [
    "virtual_env",
    "username",
    "hostname",
    "ssh",
    "cwd",
    "git",
    "hg",
    "jobs",
    "root"
  ],
  "cwd": {
    "max_depth": 2,
    "full_cwd": "true"
  },
  "vcs": {
    "show_symbol": "true"
  }
}

```

or my remote config


```c
{
  "segments": [
    "virtual_env",
    "hostname",
    "newline",
    "username",
    "ssh",
    "cwd",
    "git",
    "hg",
    "jobs",
    "root"
  ],
  "mode": "patched",
  "cwd": {
    "max_depth": 2,
    "full_cwd": "true"
  },
  "theme": "washed" ,
  "vcs": {
    "show_symbol": "true"
  }
}
```
Cheers,
