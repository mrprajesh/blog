#!/bin/bash
GITHUB=../mrprajesh.github.io/blog

# commit src jekyll files
git add .
git commit -m "Auto updated! src"
git push origin master

# copy files to local repo then commit and push html files
rsync -arvh  _site/ "$GITHUB"
cd "$GITHUB"
git add .
git commit -m "Auto updated! - blog"
git push origin master
cd -

