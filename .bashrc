#!/usr/bin/env bash

[[ -f "$HOME/.shellrc" ]] && source "$HOME/.shellrc"

# Only set shell options and bindings in interactive shells
if [[ $- == *i* ]]; then
    shopt -s histappend checkwinsize
    bind "set completion-ignore-case on" 2>/dev/null
    [[ -f /etc/bash_completion ]] && source /etc/bash_completion
fi

parse_git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1='\[\033[0;34m\][\u@\h:\w]\[\033[0;32m\]$(parse_git_branch)\[\033[0;34m\]$\[\033[0m\] '