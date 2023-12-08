# Prerequisites

`sudo apt install unzip`

[NerdFont](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip)

`unzip ./Downloads/JetBrainsMono.zip -d ~/.local/share/fonts`

#### autostart.sh

`chmod 755 autostart.sh`

#### ~/.config/nvim

`sudo apt install npm nodejs curl ninja-build gettext cmake unzip curl`

`git clone https://github.com/neovim/neovim`

`cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo`

`sudo make install`

```bash
echo 'alias vi="nvim"
alias vim="nvim"' >> .bashrc`

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

#### ~/.config/xfce4/terminal/terminalrc

`sudo apt install xfce4-terminal`

#### ~/.config/i3/config

`sudo apt install xorg i3`

