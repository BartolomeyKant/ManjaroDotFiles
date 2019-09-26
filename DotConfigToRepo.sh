#!/bin/bash

. ./SyncRepoConfig	# settings for syncing

# Copy dotfiles from home directory to repository
for dir in ${SyncDirs[@]}; do
	echo "Copy dir: [$dir] to repository"
	cp $Prefix/$dir $PWD/ -r 
done
