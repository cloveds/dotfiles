#!/bin/bash
sudo apt install unzip npm nodejs curl ninja-build gettext cmake spice-vdagent xfce4-terminal xorg i3 firefox-esr zsh zsh-syntax-highlighting -y
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
mkdir .local .local/share 
unzip ~/JetBrainsMono.zip -d ~/.local/share/fonts
mv ~/dotfiles/linux/.config ~/.config
mv ~/dotfiles/linux/.xinitrc ~/.xinitrc
mv ~/dotfiles/linux/autostart.sh ~/autostart.sh
chmod 755 autostart.sh
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo 'rm -rf .zshrc \ 
mv ~/dotfiles/linux/.zshrc ~/.zshrc' >> ~/install.sh
