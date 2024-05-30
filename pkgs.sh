sudo pacman -S npm hyprland waybar kitty base-devel cmake unzip ninja curl 
pacman -S --needed base-devel openssl zlib xz tk
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
cd ~/.pyenv && src/configure && make -C src
