#!/bin/sh


git init
git add .

echo "add your commit"
read commit
git commit -m "'$commit'"

git credential-manager delete lakhdar-rouibah
git config --global user.name "uwindaji"
git remote add origin https://uwindaji:enauoram29*@github.com/uwindaji/oryx.git
git push -u origin master