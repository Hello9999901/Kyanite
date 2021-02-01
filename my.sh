#!/usr/bin/env bash

# INITIATE COLORED TEXT OUTPUT

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
bold=`tput bold`

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
sudo apt install git wget snapd cmatrix dconf-cli dconf-editor gnome-tweak-tool zip unzip gnome-shell-extension-autohidetopbar
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

# INSTALL THEMES

    # INSTALL APPS THEME
echo "Installing Flat-Remix-GTK Application Themes"
sudo add-apt-repository ppa:daniruiz/flat-remix
sudo apt install flat-remix-gtk

    # INSTALL CURSOR THEME
echo "Installing WhiteSur-cursor Theme"
cd Downloads
git clone https://github.com/vinceliuice/WhiteSur-cursors.git
cd WhiteSur-cursors
./install.sh
cd

    # INSTALL GNOME TERMIANL THEME
echo "Installing Gnome Terminal Dracula Theme"
cd Downloads
git clone https://github.com/dracula/gnome-terminal
cd gnome-terminal
./install.sh
cd

# CHANGING DOCK-TO-DOCK SETTINGS
echo "Changing Dock-to-Dock Settings"
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
gsettings set org.gnome.shell.extensions.dash-to-dock transparency 0.3
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 56
gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items true

# CHANGE SCROLL DIRECTION
echo "Changing Scroll Direction"
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true
echo "Touchpad Scroll Direction Changed"
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true
echo "Mouse Scroll Direction Changed"

# CHANGE WALLPAPER
echo "Changing Wallpaper"
cd Pictures
wget https://github.com/Hello9999901/Customized-Ubuntu/raw/main/Media/abstract-smoke.jpg
gsettings set org.gnome.desktop.background picture-uri 'file:///home/byran/Pictures/abstract-smoke.jpg'

# CHANGE MIN, MAX, CLOSE POSITION FROM RIGHT TO LEFT
echo "Changing Position of Window (Close, Min, Max) Buttons From Right to Left"
gsettings set org.gnome.desktop.wm.preferences button-layout close,minimize,maximize:

# REBOOT (MUST BE LAST STEP)
echo "REBOOT"
sudo reboot

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