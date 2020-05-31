# .bashrc

calc() { awk "BEGIN {print $*}"; }
md5() { CertUtil -hashfile $1 MD5; }

alias ll="ls -lah"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

alias dl='cd ${USERPROFILE}/Downloads'
alias lua="winpty lua53"

source ~/setenv.sh

dl



# Legacy
# ======
# alias google="start chrome --incognito --url www.google.com"
# alias python="winpty python"
# alias env1="start cmd //k conda activate env1"
# alias jlab="start cmd //k conda run -n env1 jupyter lab --ip 127.0.0.1"
