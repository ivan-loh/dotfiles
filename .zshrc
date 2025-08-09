#!/usr/bin/env zsh

[[ -f "$HOME/.shellrc" ]] && source "$HOME/.shellrc"

autoload -Uz compinit && compinit
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST
PROMPT='%F{blue}[%n@%m:%~]%f%F{green}${vcs_info_msg_0_}%f%F{blue}$%f '