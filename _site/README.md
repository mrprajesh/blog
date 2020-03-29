# Rajesh's Blog

## Workflow

1. Run `bundle exec jekyll server` or `./run.sh`
2. Run `./newpost.sh <NEW-POST-NAME>` to create new post
3. Edit `md` file from `_post/` folder that starts with current date
4. Check on browser from [http://127.0.0.1:4000/blog](http://127.0.0.1:4000/blog) or [http://127.0.0.1:4000](http://127.0.0.1:4000)
5. Repeat 3 and 4 till it perfect
6. Git commit and push
7. The blog should appear if `gh-page` is enabled in repository settings
8. Check [https://mrprajesh.github.io/blog](https://mrprajesh.github.io/blog)

Instead of last 3 steps use `./publish.sh` due the [gerated tag issue](https://github.com/mrprajesh/blog/issues/4)

> Note: It would take a couple minutes to get published to the web.


## Features added

- [x] Set base url as `*.github.io/blog`.
- [x] Created a `R` favicon blue.
- [x] Fixed the issues created due to above using `{{site.baseurl}}`.
- [x] Changed the US format date to UK/India in front page.
- [x] Changed the date format in post, added author name.
- [x] Added last modified at the footer.
- [x] Created a template `post` and shell script to create the new post.
- [x] Added syntax highlight from jekyll-pygments using `monokai` theme.
- [x] Added grouping post year wise.
- [ ] Figure out last modified from the last modified date of `md` file?
