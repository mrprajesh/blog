---
layout: post
title: Searching jekyll posts and enabling tags in GitHub pages
date: 29-03-2020 16:42:59 +05:30
tags: [jekyll, github, gh-pages]
description:
summary:
comments: false
author: Rajesh Pandian M
---

### Search Post

Ronv's Sidey theme already had the search ability; But, was not searching post's content.
It is using the [Java script](https://github.com/christian-fei/Simple-Jekyll-Search) search.
It has nice [wiki](https://github.com/christian-fei/Simple-Jekyll-Search/wiki#enabling-full-text-search) which listed all the options.

In the `search.json` file add the below line to enable it!

```cpp
{% raw %}
"content" : {{ post.content | jsonify }}
{% endraw %}
```

### Jekyll Tags in Github Pages

I have explained the issue and my workaround for this. Sometimes the solution can be
[simple](https://github.com/mrprajesh/blog/issues/4).
