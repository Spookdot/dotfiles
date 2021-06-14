### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
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
zinit wait lucid for \
    OMZP::pip \
    OMZP::web-search \
    OMZP::colored-man-pages

zinit wait lucid as"completion" for \
    OMZP::docker/_docker \
    OMZP::rust/_rust \
    OMZP::rustup/_rustup

zinit wait lucid light-mode for \
    atinit'zicompinit; zicdreplay' \
        zdharma/fast-syntax-highlighting \
    atload'_zsh_autosuggest_start' \
        zsh-users/zsh-autosuggestions \
    blockf atpull'zinit creinstall -q .' \
        zsh-users/zsh-completions \
    nviennot/zsh-vim-plugin \
    vladmrnv/statify \
    gko/ssh-connect \
    b0o/zfzf \
    zpm-zsh/ls \
    psprint/zsh-navigation-tools \
    ytakahashi/igit \
    mdumitru/fancy-ctrl-z \
    b4b4r07/enhancd \
    zpm-zsh/clipboard \
    hlissner/zsh-autopair \
    Aloxaf/fzf-tab \
    zpm-zsh/material-colors \
    mango-tree/zsh-recall \
    ChrisPenner/session-sauce

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
            eval "$("$BASE16_SHELL/profile_helper.sh")"

alias rm='$HOME/.local/bin/safe-rm'
export SESS_PROJECT_ROOT='$HOME'
. "/opt/asdf-vm/asdf.sh"
alias ls=exa
