source $HOME/antigen.zsh

antigen use oh-my-zsh

# Default repo
antigen bundle git
antigen bundle pip
antigen bundle jenv
antigen bundle pipenv
antigen bundle rust
antigen bundle rustup
antigen bundle web-search

# Other repos
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle mattberther/zsh-pyenv
antigen bundle dominik-schwabe/zsh-fnm
antigen bundle cowboyd/zsh-rust

# Set theme
antigen theme fishy

antigen apply
