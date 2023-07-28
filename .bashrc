# Local vars
MANCMD=bat

# Enviorment variables
export MANPAGER="sh -c 'col -bx | $MANCMD -l man -p'"

# Prompt
GREEN="\[$(tput setaf 82)\]"
LIGHT_BLUE="\[$(tput setaf 39)\]"
RESET="\[$(tput sgr0)\]"
PS1="$LIGHT_BLUE\u$GREEN in \W λ$RESET "

# Aliases 
alias ls="lsd"
alias ssh="kitty +kitten ssh"
alias v="nvim"
alias themes="kitty +kitten themes"

