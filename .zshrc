# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh_hist
HISTSIZE=1000
SAVEHIST=1000
setopt notify
unsetopt beep
bindkey -v

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nova/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
export PS1="%F{blue}%n:${vcs_info_msg_0_}%f%1~ %F{cyan}󰘧%f "

export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM
export DEVKITPPC=/opt/devkitpro/devkitPPC

PATH="$PATH:$HOME/bin"

alias ls="lsd"
alias v="nvim"
alias yt="yt-dlp -o '%(title)s.%(ext)s' -x --audio-format mp3"
alias ytv="yt-dlp -o '%(title)s.%(ext)s' --recode-video mp4"
alias htop="btop -t"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
