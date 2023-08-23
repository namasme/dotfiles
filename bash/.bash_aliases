# some ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# custom aliases

alias ysabel='workon ysabel; cd /data/dev/ysabel/; bash tmux.setup.sh;'
alias mh='cd /data/dev/mh/'
