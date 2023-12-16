#!/bin/sh
sudo apt install feh compton unzip npm nodejs curl ninja-build gettext cmake spice-vdagent terminology xorg i3 firefox-esr -y
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
wget https://images.chesscomfiles.com/uploads/v1/images_users/tiny_mce/thematedkid/php7KfFOg.jpeg
sleep 1
mkdir .local .local/share
unzip ~/JetBrainsMono.zip -d ~/.local/share/fonts
sleep 1
mv ~/dotfiles/linux/.config ~/.config
mv ~/dotfiles/linux/.xinitrc ~/.xinitrc
mv ~/dotfiles/linux/autostart.sh ~/autostart.sh
sleep 1
chmod 755 autostart.sh
sleep 1
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
echo alias vi="nvim" >> ~/.bashrc
echo alias vim="nvim" >> ~/.bashrc
