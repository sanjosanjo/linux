LRED="\[\033[1;31m\]"
LBLUE="\[\033[1;34m\]"
WHITE="\[\033[1;37m\]"
GREEN="\[\033[0;32m\]"
set -o vi
MYIP=$(curl --ipv4 ifconfig.me --silent)
PS1="$GREEN$SHLVL $LRED\u@\h($MYIP).....\w\n$LBLUE\! > $WHITE"
PATH=.:$PATH

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize
shopt -s cmdhist
shopt -s cdspell
shopt -s histappend				# write history to file immediately

export HISTFILE=~/.history
export HISTIGNORE="&:ls:ll:l:lt:la:h:hh:pwd:exit:..:duh:duh2:cd"
export HISTCONTROL=ignoredups:erasedups:ignorespace
export HISTSIZE=5000
export HISTFILESIZE=5000

#  history -a  # append history lines from this session to the history file.
#History file may contain history from other terminals not in this one so:
#  history -c # clear [in-memory] history list deleting all of the entries.
#  history -r # read the history file and append the contents to the history list instead
# A new shell gets the history lines from all previous shells
#export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
export PROMPT_COMMAND="history -a;history -c;history -r;tail -1 $HISTFILE >> ~/bak/.historyinf;$PROMPT_COMMAND"
#PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'history 1 >> ~/bak/.historyinf'
alias ls='ls -F --color=auto'
#alias ls='ls -F'
alias sudo='sudo '
alias l='ls -h'
alias lt='ls -lAGtrh | cut -d " "  -f 4-'
alias ll='ls -AlGh --group-directories-first | cut -d " "  -f 4-'
alias lll='ls -Aoh --group-directories-first | cut -d " "  -f 4-'
alias ..='cd ..'
alias ...='cd ../..'
alias duh="du -xh -d 1 | sort -h"
alias duh2="du -xh -d 2 | sort -h"
alias d='df -h'
alias grep='grep --color'
alias h='history'
alias hh='history 50'
alias hr='history | sort -rn | less '
alias hgrep='history | grep '
alias hhgrep='cat ~/bak/history_total.txt | grep '
alias listen='sudo lsof -i -P | grep -i "listen"'
alias listen1='sudo ss -lnpt'
alias ports='sudo lsof -i -P -n'
alias psss='ps -ef --sort=start_time'
alias pss='ps axjf'
alias ver='lsb_release -a'
alias web='cd /var/www/html'
alias myip='curl --ipv4 ifconfig.me'
alias info='bat /home/andy/unix_notes.txt'
#alias info='git -C ~/git/linux pull && bat ~/git/linux/unix_notes.txt'
alias redo='sudo $(history -p !!)'
alias sysinfo='neofetch;cat /proc/cpuinfo | grep "MHz\|name"; cat /proc/meminfo | grep MemTotal;uname -m'
alias shelltype='echo $0a'
alias pstree1='pstree -aplh'
alias down='cd /var/www/html/downloads/complete'
alias ta='tmux new -A -s andy'
alias tm='tmux new -A -s music'
alias ncdux='ncdu --exclude='/var/www/html/drivemusic/*''
alias dux='du --exclude='/var/www/html/drivemusic/*''
alias serv='systemctl list-units --type=service -all'
alias serv1='systemctl list-unit-files --type=service -all'
alias akpy='source ~/akpy/bin/activate'
alias frl='sudo firewall-cmd --reload && sudo firewall-cmd --list-all'
alias ffprobebit='/usr/bin/ffprobe -hide_banner -v error -show_entries stream=bit_rate -of default=noprint_wrappers=1 '
alias upd='sudo apt update && apt list --upgradeable'
alias upg='sudo apt upgrade -y'

