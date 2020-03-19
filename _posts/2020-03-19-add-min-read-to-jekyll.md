---
layout: post
title: How to add mins to read in jekyll post like medium
date: 19-03-2020 18:53:53 +05:30
tags: [jekyll]
description:
summary:
comments: false
author: Rajesh Pandian M
---

Edit the `_layouts/post.html` and place below lines appropriately.

> {% raw %}
> {% assign words = content \| number_of_words %}
>
> {{ words \| plus:179 \| divided_by:180  }} min read
> {% endraw %}


## References

- I got this idea from [Carlos Becker's post](https://carlosbecker.com/posts/jekyll-reading-time-without-plugins)
- He has used `if-else`
- Whereas I have **avoided** that using `ceil(words/180)` i.e same as `(words+179)/180`

> {% raw %}
>
> <span class="reading-time" title="Estimated read time">
>
> {% assign words = content \| number_of_words %}
>
> {% if words < 360 %}
>
>   1 min
>
> {% else %}
>
>   {{ words \| divided_by:180 }} mins
>
> {% endif %}
>
> </span>
>
>{% endraw %}


