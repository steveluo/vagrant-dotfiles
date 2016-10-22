# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Standard-Widgets

bindkey -v                                          # Use vi key bindings
autoload -Uz edit-command-line

bindkey '^O' zaw-git-files-legacy

bindkey -v                                          # Use vi key bindings
# bindkey '^R' history-incremental-search-backward    # [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.

# emacs style
# bindkey '^a' beginning-of-line
bindkey '^ ' autosuggest-accept

# zaw key bindings
bindkey '^R' zaw-history
bindkey '^X^F' zaw-git-files
bindkey '^X^B' zaw-git-branches
bindkey '^X^P' zaw-process

# Make numpad enter work
bindkey -s "^[Op" "0"
bindkey -s "^[Ol" "."
bindkey -s "^[OM" "^M"

# Ctrl-backspace and ctrl-delete.
bindkey '^w'    backward-kill-word # <c-bs>.

# bindkey '^P' history-substring-search-up
# bindkey '^N' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
bindkey -M emacs '^V' edit-command-line


# emacs style
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# Home and end.
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

