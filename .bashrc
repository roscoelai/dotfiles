# .bashrc
# 2021-10-30

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

set -o noclobber

export USERPROFILE=${USERPROFILE//\\//}
export USERPROFILE=${USERPROFILE/C://c}

export PATH="\
${PATH}:\
"

alias l.='ls -d .* --color=auto'
alias ll='ls -ahl --color=auto'
alias grep='grep --color'
alias tree='tree -hC'

# abc() { awk "BEGIN { print "$*" }"; }
abc() { gawk -M "BEGIN { print "$*" }"; }

conda() {
    local miniconda3="${EXEPATH}/opt/Miniconda3"
    local activate="${miniconda3}/Scripts/activate.bat"
    start cmd //k "${activate}" "${miniconda3}"
}

echo_color() { echo -e '\033[0;'"$*"'\033[0m'; }

green() { echo_color '32m'"$*"; }
yellow() { echo_color '33m'"$*"; }
magenta() { echo_color '35m'"$*"; }
cyan() { echo_color '36m'"$*"; }
white() { echo_color '0m'"$*"; }
