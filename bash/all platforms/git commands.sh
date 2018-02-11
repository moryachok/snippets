#!/usr/bin/env bash

# Configuration commands
git config --global user.name "name"
git config --global user.email "email"
git config --global core.editor vim
git config --global color.ui auto

# add repo as submodule  https://github.com/blog/2104-working-with-submodules
git submodule add {repo url} {folder to create}

# update current directory to remote version of the submodule, used as revert
git submodule update 

# will point local repo to latest master remote version
git submodule update --remote

# setting remove url as ssh
git remote set-url origin git@github.com:moryachok/snippets.git

#reset current branch back to 3 commmits
git reset --hard HEAD~3

#reset current branch back to specific commit
git reset --hard <commit id>

# check ssh connection
ssh -T git@bitbucket.org
ssh -T git@github.com
