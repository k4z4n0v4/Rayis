#!/bin/env sh 

echo "[#] Installing Packages..."
sudo pacman -S awk tr 

packages=$(awk '/#####/ {exit} {print $1}' installed.txt | tr '\n' ' ')
aur=$(awk '{if(found) print $1} /#####/{found=1}' installed.txt | tr '\n' ' ')

pacman -S $packages

sudo -E aura-bin -Akax $aur

cd dmenu/
make && sudo make install

cd ../st/ 
make && sudo make install


echo "[+] Packages successfully installed!"
echo "[#] Configuring home..."

cd ..
cp -r .config/*  $HOME/.config/ 
cp  .bashrc .bash_profile .Xresources $HOME/

echo "[#] Home done!"

echo "[#] Installing vim-plug..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \ 
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
