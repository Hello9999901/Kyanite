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
    normalInstall=true
elif [ ${1:-pass} = "-p" ]
then
    installPiper=true
    normalInstall=true
elif [ ${1:-pass} = "-switchgraphics" ]
then
    installSwitchgraphics=true
    normalInstall=true
elif [ ${1:-pass} = "-nd" ]
then
    installNvidiaDrivers=true
    normalInstall=true
else 
    normalInstall=true
fi

if [ ${2:-pass} = "-r" ]
then
    installRazer=true
    normalInstall=true
elif [ ${2:-pass} = "-p" ]
then
    installPiper=true
    normalInstall=true
elif [ ${2:-pass} = "-switchgraphics" ]
then
    installSwitchgraphics=true
    normalInstall=true
elif [ ${2:-pass} = "-nd" ]
then
    installNvidiaDrivers=true
    normalInstall=true
else 
    normalInstall=true
fi

if [ ${3:-pass} = "-r" ]
then
    installRazer=true
    normalInstall=true
elif [ ${3:-pass} = "-p" ]
then
    installPiper=true
    normalInstall=true
elif [ ${3:-pass} = "-switchgraphics" ]
then
    installSwitchgraphics=true
    normalInstall=true
elif [ ${3:-pass} = "-nd" ]
then
    installNvidiaDrivers=true
    normalInstall=true
else 
    normalInstall=true
fi

if [ ${4:-pass} = "-r" ]
then
    installRazer=true
    normalInstall=true
elif [ ${4:-pass} = "-p" ]
then
    installPiper=true
    normalInstall=true
elif [ ${4:-pass} = "-switchgraphics" ]
then
    installSwitchgraphics=true
    normalInstall=true
elif [ ${4:-pass} = "-nd" ]
then
    installNvidiaDrivers=true
    normalInstall=true
else 
    normalInstall=true
fi

if [ ${1:-pass} = "-h" ]
then
    installNvidiaDrivers=false
    installPiper=false
    installRazer=false
    installSwitchgraphics=false
    normalInstall=false
    echo "Help stuff"
fi

#–––––––––––BEGIN PROCESS––––––––––––

#–––––––––––BASE INSTALLS––––––––––––

if [ "$normalInstall" = true ]
then
    echo -e "${green}${bold}\n\nAre you SURE you want to install all the application and utilities listed in the README.md? (Yes/No)"
    read install
    if [ "$install" = "Yes" ]
    then
        true
    else
        exit
    if [ "$installRazer" = true ]
    then
        echo -e "${green}${bold}\n\nInstalling Razer Selected (Polychromatic)\n\n"
    fi
    if [ "$installPiper" = true ]
    then
        echo -e "${green}${bold}\n\nInstalling Piper Gaming Mouse Selected\n\n"
    fi
    if [ "$installPiper" = true ]
    then
        echo -e "${green}${bold}\n\nInstalling Piper Gaming Mouse Selected\n\n"
    fi
    if [ "$installSwitchgraphics" = true ]
    then
        echo -e "${green}${bold}\n\nInstalling System76 GPU Switching Selected\n\n"
    fi
    if [ "$installNvidiaDrivers" = true ]
    then
        echo -e "${green}${bold}\n\Install Nvidia Drivers Selected\n\n"
    fi
    # UPDATE AND UPGRADE
    echo -e "${green}${bold}\n\nUpdating\n\n"
    sudo apt-get update
    echo -e "${green}${bold}\n\nUpgrading\n\n"
    sudo apt-get upgrade

    # CLI TOOLS
    echo -e "${green}${bold}\n\nInstalling git, wget, snapd, cmatrix, dconf-cli, dconf-editor, gnome-tweak-tool, zip, unzip, autohidetopbar, ffmpeg and hwinfo\n\n"
    sudo apt install git wget snapd cmatrix dconf-cli dconf-editor gnome-tweak-tool zip unzip gnome-shell-extension-autohidetopbar hwinfo ffmpeg
    echo -e "${green}${bold}\n\nAdding apt-repository universe\n\n"
    sudo add-apt-repository universe

    # INSTALL ZOOM
    echo -e "${green}${bold}\n\nInstalling Zoom\n\n"
    cd ~/Downloads/
    wget https://zoom.us/client/latest/zoom_amd64.deb
    sudo apt install ./zoom_amd64.deb
    rm -rf zoom_amd64.deb
    cd

    # INSTALL BLENDER
    echo -e "${green}${bold}\n\nInstalling Blender\n\n"
    sudo snap install blender --classic

    # INSTALL PULSEEFFECTS
    sudo add-apt-repository ppa:mikhailnov/pulseeffects
    sudo apt install pulseaudio pulseeffects --install-recommends

    # INSTALL VISUAL STUDIO CODE
    sudo snap install code --classic

    # INSTALL OBS
    sudo add-apt-repository ppa:obsproject/obs-studio
    sudo apt install obs-studio

    # INSTALL THEMES
        # INSTALL APPS THEME
    echo -e "${green}${bold}\n\nInstalling Flat-Remix-GTK Application Themes\n\n"
    sudo add-apt-repository ppa:daniruiz/flat-remix
    sudo apt install flat-remix-gtk

        # INSTALL CURSOR THEME
    echo -e "${green}${bold}\n\nInstalling WhiteSur-cursor Theme\n\n"
    cd Downloads
    git clone https://github.com/vinceliuice/WhiteSur-cursors.git
    cd WhiteSur-cursors
    ./install.sh
    cd

        # INSTALL GNOME TERMIANL THEME
    echo -e "${green}${bold}\n\nInstalling Gnome Terminal Dracula Theme\n\n"
    cd Downloads
    git clone https://github.com/dracula/gnome-terminal
    cd gnome-terminal
    ./install.sh
    cd

    # CHANGING DOCK-TO-DOCK SETTINGS
    echo -e "${green}${bold}\n\nChanging Dock-to-Dock Settings\n\n"
    gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
    gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
    gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
    gsettings set org.gnome.shell.extensions.dash-to-dock transparency 0.3
    gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 56
    gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items true

    # CHANGE SCROLL DIRECTION
    echo -e "${green}${bold}\n\nChanging Scroll Direction\n\n"
    gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true
    echo -e "${green}${bold}\n\nTouchpad Scroll Direction Changed\n\n"
    gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true
    echo -e "${green}${bold}\n\nMouse Scroll Direction Changed\n\n"

    # CHANGE WALLPAPER
    echo -e "${green}${bold}\n\nChanging Wallpaper\n\n"
    cd Pictures
    wget https://github.com/Hello9999901/Customized-Ubuntu/raw/main/Media/abstract-smoke.jpg
    gsettings set org.gnome.desktop.background picture-uri 'file:///home/byran/Pictures/abstract-smoke.jpg'
    cd

    # CHANGE MIN, MAX, CLOSE POSITION FROM RIGHT TO LEFT
    echo -e "${green}${bold}\n\nChanging Position of Window (Close, Min, Max) Buttons From Right to Left\n\n"
    gsettings set org.gnome.desktop.wm.preferences button-layout close,minimize,maximize:

    # ADD WhiteSur FIREFOX THEME
    echo -e "${green}${bold}\n\Adding WhiteSur Firefox Theme into Downloads Folder\n\n"
    cd Downloads
    git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
    mv 'WhiteSur-gtk-theme/src/other/firefox/chrome/' 'Downloads/'
    rm -rf WhiteSur-gtk-theme
    mv Downloads chrome
fi

#––––––––––––OPTIONAL INSTALLS––––––––––––––

if [ "$installRazer" = true ]
then
    echo -e "${green}${bold}\n\nInstalling Razer Software (Polychromatic)\n\n"
    # Install Linux-Headers
    sudo apt install linux-headers-5.8.0-41-lowlatency
    # Install OpenRazer Daemon
    sudo add-apt-repository ppa:openrazer/stable
    sudo apt install openrazer-meta
    # Install Polychromatic GUI
    sudo add-apt-repository ppa:polychromatic/stable
    sudo apt install polychromatic
fi


if [ "$installPiper" = true ]
then
    echo -e "${green}${bold}\n\nInstalling Piper Gaming Mouse Software\n\n"
    sudo apt install piper
fi


if [ "$installPiper" = true ]
then
    echo -e "${green}${bold}\n\nInstalling Piper Gaming Mouse Software\n\n"
    sudo apt install piper
fi


if [ "$installSwitchgraphics" = true ]
then
    echo -e "${green}${bold}\n\nInstalling System76 GPU Switching Software\n\n"
    sudo apt-add-repository ppa:system76-dev/stable
    sudo apt install gnome-shell-extension-system76-power system76-power
fi


if [ "$installNvidiaDrivers" = true ]
then
    echo -e "${green}${bold}\n\nINSTALL NVIDIA DRIVERS\n\n"
    sudo ubuntu-drivers autoinstall
fi

# REBOOT (MUST BE LAST STEP)
if [ "$normalInstall" = true ]
echo -e "${green}${bold}\n\nREBOOTING\n\n"
sudo reboot
fi