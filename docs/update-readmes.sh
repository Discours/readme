#!/bin/bash

# This file is used to update MANIFEST of other projects, where it is included in the README

display_usage() { 
	echo -e "\nUsage:\n./docs/update-readmes.sh ../*/package.json\n(if all discours projects are on the same level as discours-welcome)" 
} 

if [  $# -le 1 ] 
then 
	display_usage
	exit 1
fi

if [[ ( $# == "--help") ||  $# == "-h" ]] 
then 
	display_usage
	exit 0
fi 

initial_pwd=$(pwd)
parent_dir="$(dirname "$initial_pwd")"

for f in $@
do
  cd $(dirname $f)
  echo "Switching to develop"
  git checkout develop
  echo "Updating README file"
  npm run docs:readme || true
  echo "File updated"
  echo "git diff:"
  git diff | cat
  read -r -p "Are you sure to commit and push? [y/N]" response
  if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
  then
    echo "Adding, commiting, pushing..."
  else
    cd $initial_pwd
    continue
  fi
  echo "Adding file to git"
  git add README.md
  echo "Doing a commit"
  git commit -m "chore($f): update README.md"
  git push
  cd $initial_pwd
done