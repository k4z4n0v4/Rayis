#!/bin/bash


for folder in $(ls $PWD/.config/); do 
	if [[ $folder != "nvim" ]]; then
		cp ~/.config/$folder $PWD/.config/ -r
	elif [[ $folder == "nvim" ]]; then
		cp ~/.config/nvim/init.vim ~/.config/nvim/coc-settings.json -t $PWD/.config/nvim/
	fi
done
cp $HOME/.bashrc $HOME/.bash_profile -t $PWD
cd ~/notwerk/Rayis
git add . 
git status
echo "Commit message: "
read commit
git commit -m "$commit"
git push origin master 
