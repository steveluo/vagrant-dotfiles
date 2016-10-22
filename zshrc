# zmodload zsh/zprof

export ZDOTDIR=$HOME
HOSTNAME=`hostname`
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=100000
LISTMAX=1000

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Less
export LESSSECURE=1

# history mgmt
# http://www.refining-linux.org/archives/49/ZSH-Gem-15-Shared-history/
setopt inc_append_history
setopt share_history

# Base Configuration {{{
# Load zplug {{{
[[ -f ~/.zshrc.antigen ]] && source ~/.zshrc.antigen
# [[ -f ~/.zshrc.zplug ]] && source ~/.zshrc.zplug
# }}}

# initialize autocomplete here, otherwise functions won't be loaded
# autoload -U compinit
# compinit

# if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# fi
# source ~/.zpreztorc
#
# prompt pure
#
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# vim binding
bindkey -v

# }}}

# Automatically list directory contents on `cd`.
auto-ls () {
  emulate -L zsh;
  # explicit sexy ls'ing as aliases arent honored in here.
  hash gls >/dev/null 2>&1 && CLICOLOR_FORCE=1 gls -aFh --color --group-directories-first || ls
}
chpwd_functions=( auto-ls $chpwd_functions )

# [[ -f /usr/local/share/zsh/site-functions/_aws ]] && source /usr/local/share/zsh/site-functions/_aws

# [[ -f ~/bin/z.sh ]] && source ~/bin/z.sh
eval "$(fasd --init auto)"

# More external options {{{
source ~/.aliases
source ~/.exports
source ~/.zsh/key-bindings.zsh
source ~/.zsh/fasd.zsh
source ~/.zsh/zaw.zsh

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
# }}}


[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


# zprof | pbcopy
# exit

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
