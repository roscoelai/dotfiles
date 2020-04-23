# .bashrc

PATH="$PATH:$(cat ~/addpaths.txt | tr '\n' ':' | sed 's/:$//')"

md5() {
    CertUtil -hashfile $1 MD5
}

alias tree="tree.com //a"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

source ~/envvars.sh

alias dl="cd $DL"
alias dm="cd $DM"
alias vpn="start chrome --url $VPN"
alias hpc="time ssh $USER@$HPC"
alias woa=$WOA
alias m110="start chrome --incognito --url $RC110"

alias env1="start cmd //k conda activate env1"
alias jlab="start cmd //k conda run -n env1 jupyter lab --ip 127.0.0.1"

dl



# Legacy (for educational purposes)
# =================================

# alias google="start chrome --incognito --url www.google.com"
# alias python="winpty python"
