# Local vars
MANCMD=bat

# Enviorment variables
export MANPAGER="sh -c 'col -bx | $MANCMD -l man -p'"

# Prompt Customization
LIGHT_PURP="\[$(tput setaf 69)\]"
PURPLE="\[$(tput setaf 63)\]"
DARK_PURP="\[$(tput setaf 67)\]"
RESET="\[$(tput sgr0)\]"


PS1="$LIGHT_PURP[\u"; # Light purple user
PS1+="$PURPLE@\h]"; # Purple host
PS1+="$DARK_PURP:\W>$RESET "; # Dark purple working directory
export PS1;

# Aliases 
alias nv="nvim"
alias music="~/Scripts/music.sh"
alias ls="lsd -a --total-size"
alias yt="yt-dlp -o '%(title)s.%(ext)s' -x --audio-format mp3"
# Backup in case for whatever reason I can't use lsd instead of ls
# alias ls="ls --color -laAh"


