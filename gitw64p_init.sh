#!/usr/bin/env bash

# File: gitw64p_init.sh
# Setup script for 64-bit Git for Windows Portable

function initialize() {
    local h="/home"
    mkdir -p $h "/opt/.packages"
    printf "Transparency=medium\nWindow=full" > /etc/minttyrc
    cp /etc/profile /etc/_profile
    sed -i "28i HOME=$h\nHOMEDRIVE=$h\nHOMEPATH=$h\nHISTFILE=$h\n" /etc/profile
}

initialize

logout
