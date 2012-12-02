#!/usr/bin/env zsh

PROMPT='
%{$fg_bold[cyan]%}%~ $(git_prompt_info)%{$fg_bold[cyan]%}: %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}[%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[yellow]%}*"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[blue]%}]"
