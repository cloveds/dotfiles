#!/bin/sh
sudo apt install build-essential unzip curl ninja-build gettext cmake spice-vdagent xfce4-terminal xorg i3 firefox-esr libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev -y
sleep 2
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
mkdir .local .local/share
unzip ~/JetBrainsMono.zip -d ~/.local/share/fonts
mv ~/dotfiles/.config ~/.config
mv ~/dotfiles/.xinitrc ~/.xinitrc
mv ~/dotfiles/autostart.sh ~/autostart.sh
chmod 755 autostart.sh
sleep 2
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
sleep 2
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
cd ~/.pyenv && src/configure && make -C src
sleep 1
echo alias vi="nvim" >> ~/.bashrc
echo alias vim="nvim" >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
