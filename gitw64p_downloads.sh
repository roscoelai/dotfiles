#!/usr/bin/env bash

# File: gitw64p_downloads.sh

function gh_raw() {
    local repo=$1
    local file=$2
    local dest=$3
    mkdir -p $dest
    curl "https://raw.githubusercontent.com/$repo/$file" > "$dest/$file"
}

function gh_clone() {
    local usr=$1
    local pkg=$2
    local dest="$3/$pkg"
    mkdir -p $dest
    git clone --depth=1 "https://github.com/$usr/$pkg" $dest
    rm -rf "$dest/.git"
}

function msys2xz() {
    local fver=$1
    local file="$fver-x86_64.pkg.tar.xz"
    curl "http://repo.msys2.org/msys/x86_64/$file" > "/opt/.packages/$file"
    mkdir -p "/opt/$fver"
    tar -xvf "/opt/.packages/$file" -C "/opt/$fver"
    echo "/opt/$fver/usr/bin" >> "/home/.bash_paths"
}

function mingw64xz() {
    local fver=$1
    local file="mingw-w64-x86_64-$fver-any.pkg.tar.xz"
    curl "http://repo.msys2.org/mingw/x86_64/$file" > "/opt/.packages/$file"
    mkdir -p "/opt/$fver"
    tar -xvf "/opt/.packages/$file" -C "/opt/$fver"
    echo "/opt/$fver/mingw64/bin" >> "/home/.bash_paths"
}

function downloads() {
    # Download dotfiles
    gh_raw "roscoelai/dotfiles/master" ".vimrc" "/home"
    gh_raw "roscoelai/dotfiles/master" ".bashrc" "/home"

    # Download vim-polyglot
    gh_clone "sheerun" "vim-polyglot" "/home/.vim/pack/default/start"

    # # Download vim-code-dark
    # gh_clone "tomasiser" "vim-code-dark" "/home/.vim/pack/default/start"

    # Download rsync, tree, lua
    msys2xz "rsync-3.1.3-1"
    msys2xz "tree-1.8.0-1"
    mingw64xz "lua-5.3.5-1"

    # Download zstd
    local ver="v1.4.5"
    local fver="zstd-$ver"
    local file="$fver-win64.zip"
    local repo="https://github.com/facebook/zstd/releases/download"
    curl -L "$repo/$ver/$file" > "/opt/.packages/$file"
    mkdir -p "/opt/$fver"
    unzip "/opt/.packages/$file" -d "/opt/$fver"
    echo "/opt/$fver" >> "/home/.bash_paths"
}

# downloads



## Others

# Download Miniconda3 Windows 64-bit
# file="Miniconda3-latest-Windows-x86_64.exe"
# curl -LO "https://repo.anaconda.com/miniconda/$file"

# Download java
# ver="13.0.2-14"
# fver="oracle-jdk-portable-win64-$ver"
# file="$fver.7z"
# repo="https://github.com/portapps/oracle-jdk-portable/releases/download"
# curl -L "$repo/$ver/$file" > "/opt/.packages/$file"
# mkdir -p "/opt/$fver"
# 7z x "/opt/.packages/$file" -o"/opt/$fver"
# echo "/opt/$fver/app/bin" >> "/home/.bash_paths"

## Challenging

# Download tmux
# fver="tmux-3.1-1"
# file="$fver-x86_64.pkg.tar.zst"
# curl "http://repo.msys2.org/msys/x86_64/$file" > "/opt/.packages/$file"
# mkdir -p "/opt/$fver"
# tar -I zstd -xvf "/opt/.packages/$file" -C "/opt/$fver"
# echo "/opt/$fver/usr/bin" >> "/home/.bash_paths"

## ext=${file##*.}

## Obsolete

# Download tcc
# fver="tcc-0.9.27"
# file="$fver-win64-bin.zip"
# repo="http://download.savannah.gnu.org/releases/tinycc"
# curl "$repo/$file" > "/opt/.packages/$file"
# mkdir -p "/opt/$fver"
# unzip "/opt/.packages/$file" -d "/opt/$fver"
# echo "/opt/$fver" >> "/home/.bash_paths"
