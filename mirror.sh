#!/bin/bash

cd /mirror
git config --global user.email "$GIT_USER_EMAIL"
git config --global user.name "$GIT_USER_NAME"

git $GIT_ARGS clone -b $GIT_BRANCH $GIT_REPO .
git lfs install --force

busybox httpd -p8080 -h /mirror&

cmd="httrack \
\"$URL\" \
$FILTERS \
-O /mirror -o -M1000000000 \
-q \
$HTTRACK_ARGS \
--user-agent \"$USER_AGENT\""
echo "Run $cmd"
$cmd

git add .
git commit -m "`date`"
git $GIT_ARGS push origin $GIT_BRANCH