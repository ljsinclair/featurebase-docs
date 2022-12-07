#!/bin/bash

echo Pull latest
git pull
echo Build site
bundle exec jekyll build
echo run html proofer
bundle exec htmlproofer ./_site
