#!/usr/bin/bash

h="/home"
mkdir -p $h "/opt/.packages"
printf "Transparency=medium\nWindow=full" > /etc/minttyrc
cp /etc/profile /etc/profile-original
sed -i "28i HOME=$h\nHOMEDRIVE=$h\nHOMEPATH=$h\nHISTFILE=$h\n" /etc/profile
git config --global core.askPass ""
git config --global credential.helper ""

logout
