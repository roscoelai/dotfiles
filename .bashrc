# .bashrc
# 2022-03-12

[[ "$-" != *i* ]] && return

# set -o noclobber

if [[ "$(uname -s)" =~ .*CYGWIN|MINGW|MSYS.* ]]; then
    USERPROFILE=${USERPROFILE//\\//}
    USERPROFILE=${USERPROFILE/C://c}
fi

# export PATH="\
# ${PATH}:\
# "

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[92m\]\u@\[\033[94m\]\h \[\033[93m\]\w\[\033[96m\]\$(parse_git_branch)\[\033[00m\] $ "

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'

alias df='df -h'
alias du='du -h'

alias l.='ls -d .* --color=auto'
alias ll='ls -ahl --color=auto'
alias grep='grep --color'
alias tree='tree -hC'

abc() { awk "BEGIN { print "$*" }"; }

count_files() {
    # Count number of files in terminal directories
    # Here chiefly for educational purposes

    # https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
    local n="${2:-1}"

    find "$1" -type f | awk -v n="$n" 'BEGIN {FS=OFS="/"} {NF-=n; print}' | sort | uniq -c
}

RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
CYAN="\033[36m"
LRED="\033[91m"
LGREEN="\033[92m"
LYELLOW="\033[93m"
LBLUE="\033[94m"
LMAGENTA="\033[95m"
LCYAN="\033[96m"
RESET="\033[0m"

