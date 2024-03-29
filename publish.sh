#!/bin/bash

GITHUB_BLOG=../mrprajesh.github.io/blog
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
rsync -arvh  _site/ "$GITHUB_BLOG" #--delete   #caution if copied to root might delete .git or imp dirs

# copy robots.txt to root of mrprajesh.github.io
cp _site/robots.txt $GITHUB_BLOG/../

cd "$GITHUB_BLOG/.."
git add .
git commit -m "$MSG - blog"
git push origin master
cd -

echo $TSTAMP - Done!

