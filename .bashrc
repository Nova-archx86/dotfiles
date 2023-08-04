# Local vars
if [[ -e /usr/bin/bat || -e /usr/local/bin/bat ]]; then
	MANCMD=bat
	export MANPAGER="sh -c 'col -bx | $MANCMD -l man -p'"
fi

# Aliases 
if [[ -e /usr/bin/lsd || -e /usr/local/bin/lsd  ]];
then
	alias ls="lsd"
	alias ll="lsd -la"
fi

alias ls="-laAh"
alias v="nvim"
alias ssh="kitty +kitten ssh"
alias icat="kitty +kitten icat"
alias themes="kitty +kitten themes"

# Prompt
GREEN="\[$(tput setaf 82)\]"
LIGHT_BLUE="\[$(tput setaf 39)\]"
RESET="\[$(tput sgr0)\]"
PS1="$LIGHT_BLUE\u$GREEN:\W \[λ\]$RESET "


