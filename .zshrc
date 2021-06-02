source $HOME/antigen.zsh

antigen use oh-my-zsh

# Default repo
antigen bundle git
antigen bundle pip

# Other repos
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Set theme
antigen theme simple

antigen apply
