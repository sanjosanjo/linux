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
export PROMPT_COMMAND="history -a; history -c; history -r;$PROMPT_COMMAND"
#export PROMPT_COMMAND="history -a; history -c; history -r"
export HISTCONTROL=ignoredups:erasedups:ignorespace
export INPUTRC=~/.inputrc

alias sudo='sudo '
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
alias grep='grep --color '
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

alias ncdux='ncdu --exclude='/var/www/html/drivemusic/*''
alias dux='du --exclude='/var/www/html/drivemusic/*''
alias serv='systemctl list-unit-files --type service -all'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

function findsuffix {
# Display usage information if no arguments are provided
if [[ $# -eq 0 ]]; then
	printf 'Usage example: %-30s  %20s\n' "findsuffix txt"  "to find all files below current directory"
	printf 'Usage example: %-30s  %20s\n' "findsuffix txt /full/path/" "to find all files below specified directory"
	return 1
fi
# Check for path, use current directory if not specified
if [[ $# -eq 1 ]]; then
	path='.'
else
	path=$2
fi
#while :;do echo -n .;sleep 1;done &
#trap "kill $!" EXIT  #Die with parent if we die prematurely
# this is the only relevant operation.  The other stuff provides a status update and can be removed if it causes problems
find $path -name "*.$1" -exec ls -l --full-time {} \; | awk '{$1=$2=$3=$4=$5=$7=$8="";sub("    ","")}1' | awk '{gsub(/-/,"",$1);print}' | sort
#kill $! && trap " " EXIT #Kill the loop and unset the trap or else the pid might get reassigned and we might end up killing a completely different process
}

function functionaliaslist() {
    echo
    echo -e "\033[1;4;32m""Functions:""\033[0;34m"
    declare -F | awk {'print $3'}
    echo
    echo -e "\033[1;4;32m""Aliases:""\033[0;34m"
    alias | awk {'print $2'} | awk -F= {'print $1'}
    echo
    echo -e "\033[0m"
}
