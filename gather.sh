#!/bin/env sh 




echo "[#] Installing Packages..."
sudo pacman -Syu awk coreutils 

sudo awk -i inplace -v beg='#[multilib]' -v num=2 '$0==beg{c=num} c&&c--{sub(/#/,"")} 1' /etc/pacman.conf

packages=$(awk '/#####/ {exit} {print $1}' installed.txt | tr '\n' ' ')
aur=$(awk '{if(found) print $1} /#####/{found=1}' installed.txt | tr '\n' ' ')

sudo pacman -Sy $packages

sudo -E aura/aura-bin -Akax $aur

cd dmenu/
make && sudo make install

cd ../st/ 
make && sudo make install


echo "[+] Packages successfully installed!"
echo "[#] Configuring home..."

cd ..
mkdir -p $HOME/.config/
cp -r .config/*  $HOME/.config/ 
cp  .bashrc .bash_profile .Xresources $HOME/

echo "[#] Home done!"

echo "[#] Installing vim-plug..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
