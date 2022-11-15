#!/bin/bash

GITHUB=../mrprajesh.github.io/blog
TSTAMP=$(date +'%d-%b-%Y-%T')
MSG="Auto+Minor update! $TSTAMP"

if [ $# -ge 1 ]
then
  MSG="$1 - $TSTAMP"
fi

JEKYLL_ENV=production bundle exec jekyll build

# commit src jekyll files
git add .
git commit -m "$MSG"
git push origin master



# copy files to local repo then commit and push html files
rsync -arvh  _site/ "$GITHUB" --delete

# copy robots.txt to root of mrprajesh.github.io
cp _site/robots.txt $GITHUB/../

cd "$GITHUB"
git add .
git commit -m "$MSG - blog"
git push origin master
cd -

echo $TSTAMP - Done!

