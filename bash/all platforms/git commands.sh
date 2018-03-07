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

# different ssh user: bitbucket-private
git remote set-url origin git@bitbucket-private:whatever.git

######################################################################
###### RESETING AND CLEANING #########################################
######################################################################

#reset current branch back to 3 commmits
git reset --hard HEAD~3

#reset current branch back to specific commit
git reset --hard <commit id>

# show untracked files that will be removed
git clean -n

# delete untracked files
git clean -f

# delete untracked files and directories
git clean -fd

# check ssh connection
ssh -T git@bitbucket.org
ssh -T git@github.com

# get changelog between local master and remote
git --no-pager shortlog --no-merges master..origin/master



######################################################################
###### TAGS ##########################################################
######################################################################

git tag "name" # create tag from current branch

git push origin HEAD --tags # push with tags

git fetch --tags

git checkout "tags/name"





