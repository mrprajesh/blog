#!/bin/bash

GITHUB=../mrprajesh.github.io/blog
TSTAMP=$(date +'%d-%b-%Y-%T')

JEKYLL_ENV=production bundle exec jekyll build

# commit src jekyll files
git add .
git commit -m "$1 Auto updated! $TSTAMP - src"
git push origin master

# copy files to local repo then commit and push html files
rsync -arvh  _site/ "$GITHUB" --delete
cd "$GITHUB"
git add .
git commit -m "Auto updated! $TSTAMP - blog"
git push origin master
cd -

echo $TSTAMP - Done!

