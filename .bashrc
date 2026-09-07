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

ICON_COLOR=$'\e[38;2;51;204;255m' # #33ccff
DIR_COLOR=$'\e[38;2;25;230;204m' # #19e6cc (midpoint)
GIT_COLOR=$'\e[38;2;0;255;153m' # #00ff99

CLR=$'\e[0m'

# Prompt character
SKULL='☣ '

# Git branch, or # when not in a repository
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null); [[ -z "$PS1_CMD1" ]] && PS1_CMD1="#"'

# Prompt
PS1="\[${ICON_COLOR}\]${SKULL} \[${CLR}\]\[${DIR_COLOR}\]\W\[${CLR}\] \[${GIT_COLOR}\]\${PS1_CMD1}\[${CLR}\] \$ "


