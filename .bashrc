#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


if [[ $DISPLAY ]]; then
    [[ -z "$TMUX" ]] && exec tmux
fi


alias ls='ls --color=auto'

#PS1='[\u@\h \W]\$ '
#bind -x '"\C-l": echo -en "\ec"';

PS1='\[`[ $? = 0 ] && X=2 || X=1; tput setaf $X`\]\h\[`tput sgr0`\]:$PWD\n\$ '


##### CUSTOM: #####
export VISUAL="gvim"
export WINEARCH=win32
export WINEPREFIX=~/.wine32
###LC_CTYPE=ru_RU.utf8 to fix russian letters 


alias ll='ls --color=auto -lha'
alias grep='grep --color'
alias pacman='pacman --color=auto'
alias pacaur='pacaur --color=auto'
alias livestreamer='livestreamer --hls-segment-threads 4'
alias streamlink='streamlink --hls-segment-threads 4'
#alias primusrun="vblank_mode=0 primusrun"
#alias primusrun="PRIMUS_UPLOAD=2 vblank_mode=0 primusrun"

alias tru="trans :ru"



