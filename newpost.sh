#!/bin/sh
#! cp _posts/template.md _posts/$(date +'%Y-%m-%d')-$1.md

DIR=_posts
FILE=$(date +'%Y-%m-%d')-new-post.md
TITLE="Edit this to a new title" # This will be the default title

if [ $# -lt 1 ]; then
  echo "Usage: ./newpost.sh title-of-the-post"
  exit 1;
fi

if [ $# -ge 1 ] # if given with 1st args (assumes 1st arg is hyphenated)
then
  FILE=$(date +'%Y-%m-%d')-"$1".md
  TITLE=$(echo "$1" | sed 's/-/\ /g') #remove hyphens
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
echo "mathjax: false"                   >> $DIR/$FILE
echo "render_with_liquid: true"         >> $DIR/$FILE
echo "---"                              >> $DIR/$FILE
echo ""                                 >> $DIR/$FILE
echo "This is sample content post."     >> $DIR/$FILE
echo "Edit this to a new post content!" >> $DIR/$FILE



#~ echo "Title: $TITLE"                    >> $DIR/$FILE
#~ echo "Date: $(date +'%d-%b-%Y %T %:z')" >> $DIR/$FILE
#~ echo "Category: News"                   >> $DIR/$FILE
#~ echo "tags: [jekyll, coding]"           >> $DIR/$FILE
#~ echo "description:"                     >> $DIR/$FILE
#~ echo "summary:"                         >> $DIR/$FILE
#~ echo "comments: false"                  >> $DIR/$FILE
#~ echo "author: Rajesh Pandian M"         >> $DIR/$FILE
#~ echo "mathjax: false"                   >> $DIR/$FILE
#~ echo "render_with_liquid: true"         >> $DIR/$FILE
#~ echo "---"                              >> $DIR/$FILE
#~ echo ""                                 >> $DIR/$FILE
#~ echo "This is sample content post."     >> $DIR/$FILE
#~ echo "Edit this to a new post content!" >> $DIR/$FILE

echo $DIR/$FILE - created!

geany $DIR/$FILE
