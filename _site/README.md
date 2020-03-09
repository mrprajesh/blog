# Rajesh's Blog

## Workflow

1. Run `bundle exec jekyll server`
2. Run `./newpost.sh <NEW-POST-NAME>` to create new post
3. Edit `md` file from `_post/` folder with current date
4. Check on browser from [http://127.0.0.1:4000/](http://127.0.0.1:4000/)
5. Git commit and push
7. The blog should appear if `gh-page` is enables in repository settings
8. Check [https://mrprajesh.github.io/blog](https://mrprajesh.github.io/blog)



## Features added

- [x] Set base url as `*.github.io/blog`.
- [x] Create a `R` favicon blue.
- [x] Fixed the issues created due to above using `{{site.baseurl}}`.
- [x] Changed the US format date to UK/India in front page.
- [x] Changed the date format in post, added author name.
- [x] Added last modified at the footer.
- [x] Created a template `post` and shell script to create the new post.
- [ ] Figure out last modified from the last modified date of `md` file?
