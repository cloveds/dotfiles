#!/bin/sh
sudo apt install unzip npm nodejs curl ninja-build gettext cmake spice-vdagent xfce4-terminal xorg i3 polybar firefox-esr zsh zsh-syntax-highlighting -y
sleep 1
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
mkdir .local .local/share
unzip ~/JetBrainsMono.zip -d ~/.local/share/fonts
sleep 1
mv ~/dotfiles/linux/.config ~/.config
mv ~/dotfiles/linux/.xinitrc ~/.xinitrc
mv ~/dotfiles/linux/autostart.sh ~/autostart.sh
sleep 1
chmod +x ~/.config/polybar/launch.sh
chmod 755 autostart.sh
sleep 1
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
sleep 1
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
sleep 1
mv ~/dotfiles/linux/.zshrc ~/.zshrc
chsh -s $(which zsh)
