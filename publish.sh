#!/bin/bash

GITHUB=../mrprajesh.github.io/blog
TSTAMP=$(date +'%d-%b-%Y-%T')
MSG="Auto+Minor update! $TSTAMP"

if [ $# -ge 1 ]
then
  MSG="$1"
fi

JEKYLL_ENV=production bundle exec jekyll build

# commit src jekyll files
git add .
git commit -m "$MSG"
git push origin master

# copy files to local repo then commit and push html files
rsync -arvh  _site/ "$GITHUB" --delete
cd "$GITHUB"
git add .
git commit -m "Auto updated! $TSTAMP - blog"
git push origin master
cd -

echo $TSTAMP - Done!

