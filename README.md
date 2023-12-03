# Prerequisites

# ~/.config/

## nvim

`sudo apt install neovim npm nodejs curl`

`echo 'alias vi="nvim"' >> ~/.bashrc`

`echo 'alias vim="nvim"' >> ~/.bashrc`

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## xfce4/terminal/terminalrc

`sudo apt install xfce4-terminal`

## i3/config

`sudo apt install xorg i3`
