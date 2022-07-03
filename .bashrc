# Aliases 
alias msfconsole="msfconsole --quiet -x \"db_connect ${USER}@msf\""
alias nv="nvim"
alias music="~/Scripts/music.sh"
alias ls="ls --color -laAh"

# Startup starship if its installed
if [ -e /usr/bin/starship ];
then
    eval "$(starship init bash)"
fi
