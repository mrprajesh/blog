---
layout: post
title: Enable latex/mathjax in your post only if needed
date: 01-04-2020 00:19:04 +05:30
tags: [jekyll, latex]
description: Enable mathjax in your jekyll post only if needed
mathjax: true
comments: false
author: Rajesh Pandian M
render_with_liquid: false
---

- Assuming this is an extension of my earlier [mathjax post](/blog/latex-jekyll.html)
- This post contains `latex` or `math` mode symbols.

$$A_1 \times B_2 = C_3$$

- `mathjax.js` is loaded from the `default.html`, even for the post/page
- that was not using math/latex symbols it used load `mathjax.js` unnecessarily.
- 23 HTTP page request vs 4 (with mathjax vs without)
- So, decided to load (mathjax.js) only for post that has math symbols
- Have added [custom variable](https://jekyllrb.com/docs/front-matter/#custom-variables) called
`mathjax`.
- But, should remember to set variable to true in post's front matter

#### _post/2020-04-01-new-post.md

```c
---
layout: post
title: Enable latex/mathjax in your post only if needed
tags: [jekyll, latex]
mathjax: true
---
```

#### _layouts/default.html

```c
{% if page.mathjax == true %}
  {% include mathjax.html %}
{% endif %}
```

See the [full post](https://raw.githubusercontent.com/mrprajesh/blog/master/_posts/2020-04-01-with-math.md) and [default html](https://github.com/mrprajesh/blog/blob/master/_layouts/default.html#L23).
