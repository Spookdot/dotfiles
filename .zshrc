### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk
# Load Git Library for themeing
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git

setopt promptsubst
setopt prompt_subst
autoload colors
colors

zinit snippet OMZL::prompt_info_functions.zsh
zinit snippet OMZL::theme-and-appearance.zsh
zinit snippet OMZL::spectrum.zsh
zinit snippet OMZT::alanpeabody

# Default repo
# Single file plugins
zinit wait lucid for \
    OMZP::pip \
    OMZP::web-search \
    OMZP::colored-man-pages \
    OMZP::dotnet \
    OMZP::dnf \
    OMZP::docker-compose \
    OMZP::dotenv \
    OMZP::fnm \
    OMZP::gh \
    OMZP::lol \
    OMZP::npm \
    OMZP::pipenv \
    OMZP::pyenv \
    OMZP::python \
    OMZP::rsync \
    OMZP::vscode \
    OMZP::yarn \
    OMZP::extract

# Completion for single
zinit wait lucid as"completion" for \
    OMZP::docker/_docker \
    OMZP::pip/_pip \
    OMZP::docker-compose/_docker-compose \
    OMZP::rust/_rustc

zinit wait git for \
    OMZP::tmux \
    OMZP::aliases

zinit wait lucid light-mode for \
    atinit'zicompinit; zicdreplay' \
        zdharma-continuum/fast-syntax-highlighting \
    atload'_zsh_autosuggest_start' \
        zsh-users/zsh-autosuggestions \
    blockf atpull'zinit creinstall -q .' \
        zsh-users/zsh-completions \
    b0o/zfzf \
    zpm-zsh/ls \
    zpm-zsh/clipboard \
    hlissner/zsh-autopair \
    Aloxaf/fzf-tab \
    zpm-zsh/material-colors \
    MichaelAquilina/zsh-autoswitch-virtualenv

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
            eval "$("$BASE16_SHELL/profile_helper.sh")"

export SESS_PROJECT_ROOT='$HOME'
. "/opt/asdf-vm/asdf.sh" &> /dev/null
. $HOME/.asdf/asdf.sh &> /dev/null
fpath=(${ASDF_DIR}/completions $fpath)
alias ls="exa ${exa_params} $@"
alias yay="paru"
