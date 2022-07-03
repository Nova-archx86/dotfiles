# Aliases 
alias msfconsole="msfconsole --quiet -x \"db_connect ${USER}@msf\""
alias nv="nvim"
alias yt="yt-dlp --yes-playlist -x -f bestaudio/best"
alias music="~/Scripts/music.sh"
alias ls="ls --color -laAh"
alias template="cp -r /opt/devkitpro/examples/3ds/templates/application/ ."
alias ssh="kitty +kitten ssh"

# Enviorment variables
export MUSIC_PATH="/home/nova/music/"
export DEVKITPRO="/opt/devkitpro"
export DEVKITARM="/opt/devkitpro/devkitARM"
export DEVKITPPC="/opt/devkitpro/devkitPPC"

# Startup starship if its installed
if [ -e /usr/local/bin/starship ];
then
    eval "$(starship init bash)"
fi
