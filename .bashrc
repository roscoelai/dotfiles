# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

export USERPROFILE=${USERPROFILE//\\//}
export PATH="${PATH}:/opt/R-4.0.3/bin:/opt/RStudio-1.3.1093/bin"

alias dl='cd ${USERPROFILE}/Downloads'
alias ll='ls -lah'
alias l.='ls -d .* --color=auto'
alias grep='grep --color'
alias tree='tree -hC'

launch() { dl; ""$*""; cd -; }

alias rstudio='launch start rstudio'
alias sqlite='launch start sqlite3'
alias conda='launch start cmd //k \
    ${EXEPATH}\\opt\\Miniconda3\\Scripts\\activate.bat \
    ${EXEPATH}\\opt\\Miniconda3'

echo_color() { echo -e '\033[0;'"$*"'\033[0m'; }

# green() { echo_color '32m'"$*"; }
# yellow() { echo_color '33m'"$*"; }
# magenta() { echo_color '35m'"$*"; }
# cyan() { echo_color '36m'"$*"; }
 
