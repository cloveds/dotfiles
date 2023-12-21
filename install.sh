#!/bin/sh
sudo zypper in hyprland xfce4-terminal git swaybg swww waybar libjack unzip wget curl build-devel neofetch xfce4-terminal cmake ninja gettext-tools gcc automake bzip2 libbz2-devel xz xz-devel openssl-devel ncurses-devel readline-devel zlib-devel tk-devel libffi-devel sqlite3-devel gdbm-devel make findutils patch npm nodejs gcc-c++ lua54-luarocks spice-vdagent firefox
sleep 2
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
mkdir .local .local/share
unzip ~/JetBrainsMono.zip -d ~/.local/share/fonts
mv ~/dotfiles/.config ~/.config
sleep 2
git clone https://github.com/neovim/neovim
cd neovim
make
sudo make install
sleep 2
luarocks install --server=https://luarocks.org/dev luaformatter
sleep 2
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
cd ~/.pyenv && src/configure && make -C src
sleep 1
echo 'export WLR_NO_HARDWARE_CURSORS=1' >> ~/.bashrc
echo alias vi="nvim" >> ~/.bashrc
echo alias vim="nvim" >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
