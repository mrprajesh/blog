#!/bin/sh
#! cp _posts/template.md _posts/$(date +'%Y-%m-%d')-$1.md

DIR=_posts
FILE=$(date +'%Y-%m-%d')-new-post.md
TITLE="Edit this to a new title"

if [ $# -ge 1 ] # if given with args,
then
  FILE=$(date +'%Y-%m-%d')-"$1".md
  TITLE="$1"
fi

if [ -f $DIR/$FILE ] #if the same file name found then, suffix with time
then
  FILE=$(date +'%Y-%m-%d-%T').md
fi

echo "---"                               > $DIR/$FILE
echo "layout: post"                     >> $DIR/$FILE
echo "title: $TITLE"                    >> $DIR/$FILE
echo "date: $(date +'%d-%m-%Y %T %:z')" >> $DIR/$FILE
echo "tags: [jekyll, coding]"           >> $DIR/$FILE
echo "description:"                     >> $DIR/$FILE
echo "summary:"                         >> $DIR/$FILE
echo "comments: false"                  >> $DIR/$FILE
echo "author: Rajesh Pandian M"         >> $DIR/$FILE
echo "---"                              >> $DIR/$FILE
echo ""                                 >> $DIR/$FILE
echo "This is sample content post."     >> $DIR/$FILE
echo "Edit this to a new post content!" >> $DIR/$FILE

echo $DIR/$FILE - created!

geany $DIR/$FILE
