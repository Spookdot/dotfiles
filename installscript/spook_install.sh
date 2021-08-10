#!/bin/bash

cd $HOME

# Install paru
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..

# Get base dependencies
paru -S --noconfirm \
spotify-tui spotifyd yadm bitwarden-cli \
discord-canary

# Update existing packages and sources
paru --noconfirm


## APP SETUP
# Set up ASDF
git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf
. $HOME/.asdf/asdf.sh
asdf plugin-add dotnet-core https://github.com/emersonsoares/asdf-dotnet-core.git
asdf plugin-add python
asdf plugin-add nodejs
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf plugin-add gradle
asdf plugin-add kotlin

# Set up Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install topgrade
cargo install cargo-update

# Configure tmux
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

# Configure neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

yadm clone https://github.com/spookdot/dotfiles.git
