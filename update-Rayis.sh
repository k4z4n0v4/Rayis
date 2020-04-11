#!/bin/bash


for folder in $(ls ~/Rayis/.config/); do 
	if [[ $folder != "nvim" ]]; then
		cp ~/.config/$folder ~/Rayis/.config/ -r
	elif [[ $folder == "nvim" ]]; then
		cp ~/.config/nvim/init.vim ~/.config/nvim/coc-settings.json -t ~/Rayis/.config/nvim/
	fi
done
cd ~/Rayis
git add . 
git status
echo "Commit message: "
read commit
git commit -m "$commit"
git push origin master 
