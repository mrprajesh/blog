#!/bin/bash
GITHUB=../mrprajesh.github.io/blog

rsync -arvh  _site/ "$GITHUB"
cd "$GITHUB"
git add .
git commit -m "Auto updated! - blog"
git push origin master
cd -

