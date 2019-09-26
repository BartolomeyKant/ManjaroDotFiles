#!/bin/bash


# Copy dotfiles form repositori to .config directory

. ./SyncRepoConfig #setting for sync dirrectories

for dir in ${SyncDirs[@]}; do
	echo "Copy dir: [$dir] to ~/.config"
	cp $PWD/$dir $Prefix/ -r 
done
