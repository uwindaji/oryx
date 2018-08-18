#!/bin/sh


git init
git add .

echo "add your commit"
read commit
git commit -m "'$commit'"

git remote add origin https://github.com/uwindaji/oryx.git
git push -u origin master