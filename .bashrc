set -o vi
screen_num="."
THEIP=$(hostname -I | awk '{ print $1}')
PS1='$SHLVL \[\e]0;\u@\h: \w\a\]\[\033[01;31m\]\u@\h($THEIP).....\w\n\[\033[01;34m\]\! > \[\033[00m\]'
export PATH=.:$PATH:/usr/local/go/bin
# A new shell gets the history lines from all previous shells
shopt -s histappend
shopt -s cmdhist
shopt -s cdspell
shopt -s checkwinsize
export HISTFILESIZE=10000
export HISTSIZE=10000
export HISTFILE=~/.history
export HISTIGNORE="&:ls:ll:l:lt:la:h:pwd:exit:pss:cd:..:history*"
#export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
#export PROMPT_COMMAND="history -a; history -c; history -r;$PROMPT_COMMAND"
export PROMPT_COMMAND="history -a; history -c; history -r"
export HISTCONTROL=ignoredups:erasedups:ignorespace
export INPUTRC=~/.inputrc

alias listen='sudo lsof -i -P | grep -i "listen"'
alias ls='ls -F --color=auto'
alias l='ls -hlF --color=auto'
alias ll='ls -hAlF --color=auto'
alias lt='ls -hlAtrF --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias duh='du -h -d 1'
alias duh2='du -h -d 2 | sort -h'
alias d='df -h'
alias h='history'
alias hh='history 50'
alias hgrep='history | grep '
alias ver='dmesg | grep -i available;lsb_release -a'
alias pdrive='cd /mnt/p/MSI/BUSINESS/Development\ Engineering/Kiran_Section/ak/'
alias ports='sudo lsof -i -P -n'
alias pss='ps axjf'
alias myip='curl ifconfig.co'
#alias info='cat /home/andy/unix_notes.txt'
alias info='git -C ~/git/linux pull && bat ~/git/linux/unix_notes.txt'
alias redo='sudo $(history -p !!)'
alias sys='/usr/bin/neofetch;cat /proc/cpuinfo | grep "MHz\|name"; cat /proc/meminfo | grep MemTotal'
alias shelltype='echo $0'
alias ta='tmux new -A -s andy'
#alias pstree1='pstree -aplh'
alias mountall='sudo mount -t drvfs P: /mnt/p; sudo mount -t drvfs H: /mnt/h; sudo mount -t drvfs U: /mnt/u'
alias grep='grep --color '
#export PATH="/tools/start:$HOME/myapps/bin:/apps/mathworks/matlab/R2015a/bin:$PATH"


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
