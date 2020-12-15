#!/bin/bash

# Create/Overwrite /etc/minttyrc
printf "Transparency=medium\nWindow=full" > /etc/minttyrc

# Backup/Restore and edit /etc/profile
h="/home/${USERNAME}"
if [ -f /etc/profile-original ]; then
	cp /etc/profile-original /etc/profile
else
	cp /etc/profile /etc/profile-original
fi
sed -i "28i \
HOME='${h}'\n\
HOMEDRIVE='${h}'\n\
HOMEPATH='${h}'\n\
HISTFILE='${h}/.bash_history'\n" /etc/profile

if [ ! -d "${h}" ]; then
    mkdir -p "${h}"
    echo "Folder created: ${h}"
fi

opt="/opt"
if [ ! -d "${opt}" ]; then
    mkdir -p "${opt}"
    echo "Folder created: ${opt}"
fi

# Might be better to do the following manually...

# pacman -Rs $(pacman -Qqs i686)
# pacman -Rs mingw-w64-x86_64-xpdf-tools

# git config --global core.askPass ""
# git config --global credential.helper ""
# git config --global user.name "John Doe"
# git config --global user.email johndoe@example.com

# Edit /etc/profile.d/git-sdk.sh
