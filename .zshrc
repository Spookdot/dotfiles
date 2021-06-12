source $HOME/antigen.zsh

antigen use oh-my-zsh

# Default repo
antigen bundle git
antigen bundle pip

# Other repos
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle mattberther/zsh-pyenv

# Set theme
antigen theme fishy

antigen apply
