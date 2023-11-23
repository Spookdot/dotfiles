
### Bootstrap Antidote
if [[ ! -f ${ZDOTDIR:-~}/.antidote/antidote.zsh ]]; then
    print "Installing Antidote from github.com/mattmc3/antidote"
    command git clone --depth=1 https://github.com/mattmc3/antidote.git "${ZDOTDIR:-~}/.antidote" && \
        print "Installation successful." || \
        print "The clone has failed."
fi
### Finished bootstrapping antidote
fpath+=~/.zfunc
autoload -Uz compinit
compinit

# source antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

# Make various changes depending on installed programs
if (( $+commands[starship] )); then
    unset ZSH_THEME
    eval "$(starship init zsh)"
fi

if (( $+commands[thefuck] )); then
    eval "$(thefuck --alias)"
fi

if (( $+commands[bat] )); then
    alias cat="bat"
    alias rcat="cat"
fi

if (( $+commands[zoxide] )); then
    eval "$(zoxide init zsh)"
    alias cd="z"
fi

if (( $+commands[npm] )); then
    eval "$(npm completion)"
fi

if (( $+commands[bw] )); then
    eval "$(bw completion --shell zsh); compdef _bw bw;"
fi

# Add f as an easy in-terminal explorer
f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}

# Adjust SESS_PROJECT_ROOT for the folders I usually store projects in
export SESS_PROJECT_ROOT="$HOME/repos/"
for dir in $HOME/projects/*/
do
    export SESS_PROJECT_ROOT="${dir}:$SESS_PROJECT_ROOT"
done

# Additions made by other programs
# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env
fpath+=~/.zfunc
