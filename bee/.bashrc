LRED="\[\033[1;31m\]"
LBLUE="\[\033[1;34m\]"
WHITE="\[\033[1;37m\]"
GREEN="\[\033[0;32m\]"

export EDITOR='vi'
export VISUAL='vi'
set -o vi
MYIP=$(hostname -I | awk '{ print $1}')
PS1="$GREEN$SHLVL $LRED\u@\h($MYIP).....\w\n$LBLUE\! > $WHITE"
PATH=.:~/.local/bin:~/go/bin:~/.cargo/bin:$PATH

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
shopt -s cmdhist
shopt -s cdspell
shopt -s histappend				# write history to file immediately

export HISTFILE=~/.history
export HISTIGNORE="&:ls:ll:l:lt:la:h:pwd:exit:..:hh:h *"
export HISTCONTROL=ignoredups:erasedups:ignorespace
export HISTSIZE=5000
export HISTFILESIZE=5000

#  history -a  # append history lines from this session to the history file.
#History file may contain history from other terminals not in this one so:
#  history -c # clear [in-memory] history list deleting all of the entries.
#  history -r # read the history file and append the contents to the history list instead
# A new shell gets the history lines from all previous shells
#export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
export PROMPT_COMMAND="history -a;history -c;history -r;$PROMPT_COMMAND"

alias sudo='sudo '
alias ls='ls -F --color=auto'
alias l='ls -h'
alias lt='ls -AlGhtr --group-directories-first'
alias ll='ls -AlGh --group-directories-first'
alias ..='cd ..'
alias ...='cd ../..'
alias duh='sudo du -hx -d 1 | sort -h'
alias duh2='sudo du -hx -d 2 | sort -h'
alias d='df -h | { read -r line; echo "$line"; sort -rk 2,2 -h ; }'
alias grep='grep --color '
alias h='history'
alias hh='history 50'
alias hr='history | sort -rn | less '
alias hgrep='history | grep '
alias listen='sudo lsof -i -P | grep -i "listen"'
alias listen1='sudo ss -lnpt'
alias ports='sudo lsof -i -P -n'
alias pss='ps axjf'
alias psss='ps -ef --sort=start_time'
alias ver='lsb_release -a'
alias web='cd /var/www/html'
alias myip='curl ifconfig.co'
#alias notes='bat ~/git/linux/unix_notes.txt'
alias notes='git -C ~/git/linux pull && bat ~/git/linux/unix_notes.txt'
alias redo='sudo $(history -p !!)'
alias sysinfo='hostnamectl;cat /proc/cpuinfo | grep "MHz\|name"; cat /proc/meminfo | grep MemTotal'
alias shelltype='echo $0'
alias ta='tmux new -A -s andy'
alias nas='cd /mnt/nas'
alias akpy='source ~/akpy/bin/activate'
alias ncdux='sudo ncdu --exclude=/mnt/*'
alias pstree1='pstree -aplh'
alias serv='systemctl list-units --type=service -all'
alias serv1='systemctl list-unit-files --type=service -all'
alias part='sudo lsblk -e7'
alias ytd='mv ~/Downloads/complete/* /mnt/nas/web/Media/youtube/'
alias upd='sudo nala update && nala list --upgradeable'
#alias upd='sudo apt update && apt list --upgradeable'
alias upg='sudo nala upgrade -y'
#alias upg='sudo apt upgrade -y'
alias yta='mv ~/Downloads/complete/* /mnt/sanjoone/alt/archive/'
alias ffph='ffprobe -hide_banner '
# a function to download Youtube videos to the ~/Downloads/complete/ folder
function yt {
# Display usage information if no arguments are provided
if [[ $# -eq 0 ]]; then
	printf 'Download from Youtube\n'
	printf 'Usage example: %-20s  %30s\n' "yt {youtube link}"  "download video in best mp4 format to ~/Downloads/complete/"
	printf 'Usage example: %-20s  %30s\n' "yt {youtube link} {outfilename} "  "download video in best mp4 format to ~/Downloads/complete/{outfilename}.mp4"
	return 1
elif [[ $# -eq 1 ]]; then
	/home/andy/.local/bin/yt-dlp -P ~/Downloads/complete/ -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" "$1"
elif  [[ $# -eq 2 ]]; then
	/home/andy/.local/bin/yt-dlp -o ~/Downloads/complete/"$2" -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" "$1"
else
	printf 'Too many arguments provided\n'
	return 1
fi
}
