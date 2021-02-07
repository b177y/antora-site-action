#!/bin/sh

set -eu 
set -o pipefail 

echo "Using $INPUT_SITE_SOURCES_PATH"

cd $GITHUB_WORKSPACE/$INPUT_SITE_SOURCES_PATH

ls -ltr $GITHUB_WORKSPACE/$INPUT_SITE_SOURCES_PATH

git worktree add -B gh-pages build/site origin/gh-pages
antora --stacktrace $INPUT_ANTORA_PLAYBOOK

cd build/site
git add .
git commit -m "Test build static site to gh-pages"
