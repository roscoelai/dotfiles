#!/bin/bash

# Link to phone storage
termux-setup-storage

# Add its-pointless-repo
curl "https://its-pointless.github.io/setup-pointless-repo.sh" | bash

# Update .vimrc
local url="https://raw.githubusercontent.com/roscoelai/dotfiles/master/.vimrc"
curl "${url}" > "${HOME}/.vimrc"

# Install packages
pkg upgrade
pkg install gcc git make man python3 r-base tree vim
# pkg install numpy screen

