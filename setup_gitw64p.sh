#!/usr/bin/env bash

# File: setup_gitw64p.sh
# Setup script for 64-bit Git for Windows Portable

initialize() {
    h="/home"
    mkdir -p $h $h/bin $h/packages
    printf "Transparency=medium\nWindow=full" > /etc/minttyrc
    cp /etc/profile /etc/_profile
    sed -i "28i HOME=$h\nHOMEDRIVE=$h\nHOMEPATH=$h\nHISTFILE=$h\n" /etc/profile
}

m2xz() {
    cd "$h/packages"
    local fver=$1
    local file="$fver-x86_64.pkg.tar.xz"
    curl -O "http://repo.msys2.org/msys/x86_64/$file"
    mkdir -p "$h/bin/$fver"
    tar -xvf $file -C "$h/bin/$fver"
    echo "$h/bin/$fver/usr/bin" >> "$h/.paths"
}

gh_clone() {
    pkg=$1
    dest=$2
    mkdir -p $dest
    git clone --depth=1 "https://github.com/$pkg" $dest
    rm -rf "$dest/.git"
}

gh_raw() {
    repo=$1
    file=$2
    dest=$3
    mkdir -p $dest
    curl "https://raw.githubusercontent.com/$repo/$file" > "$dest/$file"
}

downloads() {
    cd $h

    # Download dotfiles
    gh_raw "roscoelai/dotfiles/master" ".vimrc" $h
    gh_raw "roscoelai/dotfiles/master" ".bashrc" $h

    # Download vim-polyglot
    gh_clone "sheerun/vim-polyglot" "$h/.vim/pack/default/start/vim-polyglot"

    # Download rsync
    m2xz "rsync-3.1.3-1"

    # Download tree
    m2xz "tree-1.8.0-1"
}

# initialize
# downloads

logout



## Others

# ext=${file##*.}

# Download zstd
# fver="zstd-v1.4.5"
# file="$fver-win64.zip"
# curl -LO "https://github.com/facebook/zstd/releases/download/v1.4.5/$file"
# mkdir -p "$h/bin/$fver"
# unzip $file -d "$h/bin/$fver"
# echo "$h/bin/$fver" >> "$h/.paths"

# Download Miniconda3 Windows 64-bit
# curl -LO "https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe"

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

# Download vim-code-dark
# fld="$h/.vim/pack/default/start"
# pkg="vim-code-dark"
# mkdir -p $fld
# git clone "https://github.com/tomasiser/$pkg" "$fld/$pkg"

## Techinically challenging

# Download tmux
# fver="tmux-3.1-1"
# file="$fver-x86_64.pkg.tar.zst"
# curl -O "http://repo.msys2.org/msys/x86_64/$file"
# mkdir -p "$h/bin/$fver"
# tar -xvf $file -C "$h/bin/$fver"
# echo "$h/bin/$fver/usr/bin" >> "$h/.paths"

## Obsolete

# Download tcc
# file="tcc-0.9.27-win64-bin.zip"
# curl -O "http://download.savannah.gnu.org/releases/tinycc/$file"
# mkdir -p "$h/bin/tcc"
# unzip $file -d "$h/bin/tcc"
# echo "$h/bin/tcc" >> "$h/.paths"
