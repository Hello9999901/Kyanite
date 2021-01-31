#!/usr/bin/env bash

#–––––––––OPTION SELECTIONS––––––––––

if [ ${1:-pass} = "-r" ]
then
    installRazer=true
elif [ ${1:-pass} = "-p" ]
then
    installPiper=true
elif [ ${1:-pass} = "-nd" ]
then
    installNvidiaDrivers=true
else 
    normalInstall=true
fi
if [ ${2:-pass} = "-r" ]
then
    installRazer=true
elif [ ${2:-pass} = "-p" ]
then
    installPiper=true
elif [ ${2:-pass} = "-nd" ]
then
    installNvidiaDrivers=true
else 
    normalInstall=true
fi
if [ ${3:-pass} = "-r" ]
then
    installRazer=true
elif [ ${3:-pass} = "-p" ]
then
    installPiper=true
elif [ ${3:-pass} = "-nd" ]
then
    installNvidiaDrivers=true
else 
    normalInstall=true
fi

#–––––––––––BEGIN PROCESS––––––––––––

#–––––––––––BASE INSTALLS––––––––––––

# UPDATE AND UPGRADE
echo "Updating"
sudo apt-get update
echo "Upgrading"
sudo apt-get upgrade

# CLI TOOLS
echo "Installing git wget snapd cmatrix"
sudo apt install git wget snapd cmatrix dconf-cli dconf-editor gnome-tweak-tool
echo "Adding apt-repository universe"
sudo add-apt-repository universe


# INSTALL ZOOM
echo "Installing Zoom"
cd ~/Downloads/
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo apt install ./zoom_amd64.deb
rm -rf zoom_amd64.deb
cd

# INSTALL BLENDER
echo "Installing Blender"
sudo snap install blender --classic

# INSTALL PULSEEFFECTS
sudo add-apt-repository ppa:mikhailnov/pulseeffects
sudo apt install pulseaudio pulseeffects --install-recommends

#––––––––––––––––––––––––––––––––––––

if [ "$installRazer" = true ]
then
    echo "INSTALL RAZER SOFTWARE"
fi





if [ "$installPiper" = true ]
then
    echo "INSTALL PIPER"
fi





if [ "$installNvidiaDrivers" = true ]
then
    echo "INSTALL NVIDIA DRIVERS"
fi