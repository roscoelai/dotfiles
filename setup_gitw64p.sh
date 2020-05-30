#!/usr/bin/env bash

# File: setup_gitw64p.sh
# Setup script for 64-bit Git for Windows Portable

initialize() {
    # Create new home directory
    h="/home"
    mkdir -p $h
    mkdir -p "$h/bin"
    mkdir -p "$h/packages"

    # Create /etc/minttyrc
    printf "Transparency=medium\nWindow=full" > /etc/minttyrc

    # Backup and edit /etc/profile
    cp /etc/profile /etc/_profile
    sed -i "28i HOME=$h\nHOMEDRIVE=$h\nHOMEPATH=$h\nHISTFILE=$h\n" /etc/profile
}

downloads() {
    # Download dotfiles
    cd $h
    url="https://raw.githubusercontent.com/roscoelai/dotfiles/master"
    curl -O "$url/.vimrc"
    curl -O "$url/.bashrc"

    # Download vim-polyglot
    fld="$h/.vim/pack/default/start"
    mkdir -p $fld
    git clone "https://github.com/sheerun/vim-polyglot" "$fld/vim-polyglot"

    # Download rsync
    cd "$h/packages"
    ver="rsync-3.1.3-1"
    file="$ver-x86_64.pkg.tar.xz"
    curl -O "http://repo.msys2.org/msys/x86_64/$file"
    mkdir -p "$h/bin/$ver"
    tar -xvf $file -C "$h/bin/$ver"
    echo "$h/bin/$ver/usr/bin" >> "$h/.paths"
}

# initialize
# downloads

logout



## Others
# Download Miniconda3 Windows 64-bit
# curl -LO "https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe"

# Download vim-code-dark
# fld="$h/.vim/pack/default/start"
# mkdir -p $fld
# git clone "https://github.com/tomasiser/vim-code-dark" "$fld/vim-code-dark"

# Download java
# ver="13.0.2-14"
# stem="oracle-jdk-portable-win64-$ver"
# file="$stem.7z"
# curl -LO "https://github.com/portapps/oracle-jdk-portable/releases/download/$ver/$file"
# mkdir -p "$h/bin/$stem"
# 7z x $file -o"$h/bin/$stem"
# echo "$h/bin/$stem/app/bin" >> "$h/.paths"

# Download lua
# file="lua-5.3.5_Win64_bin.zip"
# curl -LO "https://sourceforge.net/projects/luabinaries/files/5.3.5/Tools%20Executables/$file"
# mkdir -p "$h/bin/lua"
# unzip $file -d "$h/bin/lua"
# echo "$h/bin/lua" >> "$h/.paths"

# Download tcc
# file="tcc-0.9.27-win64-bin.zip"
# curl -O "http://download.savannah.gnu.org/releases/tinycc/$file"
# mkdir -p "$h/bin/tcc"
# unzip $file -d "$h/bin/tcc"
# echo "$h/bin/tcc" >> "$h/.paths"

# download() {
#     local url=$1
#     local file=$2
#     local dest=$3
#     local path=$4
#     local method=$5
#     cd "$h/packages"
#     curl -LO "$url/$file"
#     mkdir -p $dest
#     if [[ $method -eq "tar" ]]; then
#         tar -xvf $file -C $dest
#     elif [[ $method -eq "unzip" ]]; then
#         unzip $file -d $dest
#     elif [[ $method -eq "7z" ]]; then
#         7z x $file -o$dest
#     fi
#     echo $path >> "$h/.paths"
# }
