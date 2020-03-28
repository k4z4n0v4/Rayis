#!/bin/bash


for folder in $(ls ~/Rayis/.config/); do 
	if [[ $folder != "nvim" ]]; then
		cp ~/.config/$folder ~/Rayis/.config/ -r
	elif [[ $folder == "nvim" ]]; then
		cp ~/.config/nvim/init.vim ~/Rayis/.config/nvim/init.vim
	fi
done
cd ~/Rayis
git add . 
echo "Commit message: "
read commit
git commit -m "$commit"
git push origin master 
