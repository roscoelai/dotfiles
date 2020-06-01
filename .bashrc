# .bashrc

function calc() { awk "BEGIN {print $*}"; }
function md5() { CertUtil -hashfile $1 MD5; }

export PATH=$(\
    echo "$(cat ~/.bash_paths | tr '\n' ':')$PATH" | \
    awk 'BEGIN{RS=":"; ORS=":"} !_[$0]++' | \
    sed -E 's/:+$//'\
)

source ~/.bash_aliases

dl
