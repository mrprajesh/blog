---
layout: post
title: Installing and Hello World Go Lang!
date: 11-04-2024 04:59:46 +05:30
tags: [go, golang,]
description:
summary:
comments: false
author: Rajesh Pandian M
mathjax: false
render_with_liquid: true
---


```shell

# GO TO https://go.dev/dl/ find the stable AMD BINARY. Not ARM!? :D
wget https://go.dev/dl/go1.22.2.linux-amd64.tar.gz

# Extracted to my $HOME/install
tar -xzf go1.22.2.linux-amd64.tar.gz

# Add it to path ~/.bashrc
export PATH=$PATH:$HOME/install/go/bin

# ctrl+T
go version
>go version go1.22.2 linux/amd64

# File contents
$ cat helloGo.go
package main
import "fmt"
func main() {
  fmt.Println("Hello World Rajz!")
}

# to compile
go build helloGo.go

# to run
./helloGo
Hello World Rajz!


```



Some other housekeeping
```shell
# gopls cribbing on vim with error
# vim-go: could not find 'gopls'. Run :GoInstallBinaries to fix it
go install golang.org/x/tools/gopls@latest
```
