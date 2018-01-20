#!/usr/bin/env bash

# Configuration commands
git config --global user.name "name"
git config --global user.email "email"
git config --global core.editor vim
git config --global color.ui auto

# add repo as submodule  https://github.com/blog/2104-working-with-submodules
git submodule add {repo url} {folder to create}

git submodule update # update current directory to remote version of the submodule, used as revert

# setting remove url as ssh
git remote set-url origin git@github.com:moryachok/snippets.git
