. "$HOME/.cargo/env"
typeset -U PATH path
path=("$HOME/.local/bin" "$HOME/.jenv/bin" "$path[@]")
export PATH
