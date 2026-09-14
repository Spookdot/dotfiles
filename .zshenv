export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin"
export EDITOR="nvim"
# export ZSH="/root/.local/share/zinit/"
export ZSH_PYENV_QUIET=true
export CARGO_TARGET_DIR=$HOME/.cargo/cache
export XKB_DEFAULT_LAYOUT=de
export CC=/usr/bin/gcc
export CXX=/usr/bin/g++
export ZDOTDIR="$HOME/.config/zsh"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
. "$HOME/.cargo/env"
. "/home/spooky/.local/share/bob/env/env.sh"
