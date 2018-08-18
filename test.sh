#!/bin/sh

git remote set-url origin https://uwindaji:enauoram29*@github.com/uwindaji/oryx.git
git init
git add .

echo "add your commit"
read commit
git commit -m "'$commit'"


#git remote set-url origin https://USERNAME@github.com/USERNAME/PROJECTNAME.git
git remote add origin https://uwindaji:enauoram29*@github.com/uwindaji/oryx.git
git push -u origin master