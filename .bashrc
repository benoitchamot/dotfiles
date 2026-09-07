#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Prompt colors
BLUE=$'\e[38;5;39m'
PURPLE=$'\e[38;5;141m'
GREEN=$'\e[38;5;46m'
CLR=$'\e[0m'

# Prompt character
SKULL='☣ '

# Git branch, or # when not in a repository
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null); [[ -z "$PS1_CMD1" ]] && PS1_CMD1="#"'

# Prompt
PS1="\[${BLUE}\]${SKULL} \[${CLR}\]\[${PURPLE}\]\W\[${CLR}\] \[${GREEN}\]\${PS1_CMD1}\[${CLR}\] \$ "


