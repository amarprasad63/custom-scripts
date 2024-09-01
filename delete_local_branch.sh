#!/bin/bash

#eg: sh delete_local_branch.sh /var/www/html/project_folder
#This script deletes all those branches from local whose remote head does not exists
if [ -z "$BASH" ]; then
    echo "Please run this script '$0' with bash"
    exit 1
fi

if [ "$#" -ne 1 ]; then
    echo "sh delete_local_branch.sh <directory>"
    exit 1
fi
path=$1
cd $path
git fetch -p
for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do
    echo $branch
    git branch -D $branch
done
