#!/bin/bash
GITHUB=../mrprajesh.github.io/blog
cd
rsync -arvh  _site/ "$GITHUB"
cd "$GITHUB"
git add . && git commit -m "Auto updated!"
cd -

