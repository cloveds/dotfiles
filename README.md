# Prerequisites

# ~/.vimrc

`sudo apt install nodejs npm vim curl`

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

# ~/.config/

## nvim

`sudo apt install neovim npm nodejs curl`

`echo 'alias vi="nvim"' >> ~/.zshrc`

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## xfce4/terminal/terminalrc

`sudo apt install xfce4-terminal`

## i3/config

`sudo apt install xorg i3`

# ~/.zshrc

`sudo apt install zsh`

`chsh -s $(which zsh)`

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
