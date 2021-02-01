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
sudo apt install git wget snapd cmatrix dconf-cli dconf-editor gnome-tweak-tool zip unzip
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
# gsettings set org.gnome.desktop.background picture-uri 'file:///home/byran/Desktop/Razer%20Neon.jpeg'
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