#!/bin/sh
sudo apt install unzip curl ninja-build gettext cmake spice-vdagent xfce4-terminal xorg i3 firefox-esr -y
sleep 1
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
sleep 1
mkdir .local .local/share
sleep 1
unzip ~/JetBrainsMono.zip -d ~/.local/share/fonts
sleep 1
mv ~/dotfiles/linux/.config ~/.config
sleep 1
mv ~/dotfiles/linux/.xinitrc ~/.xinitrc
sleep 1
mv ~/dotfiles/linux/autostart.sh ~/autostart.sh
sleep 1
chmod 755 autostart.sh
sleep 1
git clone https://github.com/neovim/neovim
sleep 1
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sleep 1
sudo make install
sleep 1
echo alias vi="nvim" >> ~/.bashrc
sleep 1
echo alias vim="nvim" >> ~/.bashrc
