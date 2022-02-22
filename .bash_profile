#
# ~/.bash_profile
#
if [ -f ~/.bashrc ]
then
    source ~/.bashrc
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
. "$HOME/.cargo/env"
