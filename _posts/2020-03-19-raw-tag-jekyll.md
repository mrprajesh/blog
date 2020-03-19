---
layout: post
title: using "raw" tag in jekyll to view liquid tags
date: 19-03-2020 19:44:39 +05:30
tags: [jekyll]
description:
summary:
comments: false
author: Rajesh Pandian M
render_with_liquid: false
---

- For example in a [post](/blog/latex-jekyll.html)
 I mentioned how to enable $$\LaTeX$$ in jekyll
- at 4th step i said include the below tag.
> {% include mathjax.html %}

- jekyll did not allow me to `include` above line into `code blocks` in post.
- that is where I found this `raw` tag to be very helpful. use as below

```cpp
{% raw %}
{% include mathjax.html %}
{% endraw %}
```


Alternatively, we can disable liquid processing (jekyll v4.0+) in the post's front matter use

```render_with_liquid: false```

- see more [here](https://jekyllrb.com/docs/liquid/tags/).
