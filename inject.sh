#!/usr/bin/env bash

# INITIATE STUFF (very vague i know)

source ./prog_bar.sh # Get progress bar code
enable_trapping # Enable trapping for progress bar (check prog_bar.sh for more info)
# Colors
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
    echo -e "${green}${bold}\n\nAre you SURE you want to install all the application and utilities listed in the README.md? (Yes/No)${reset}"
    read install
    if [ "$install" = "Yes" ]
    then
        setup_scroll_area
        true
    else
        exit
    fi
    if [ "$installRazer" = true ]
    then
        echo -e "${green}${bold}\n\nWill Install Razer Software (Polychromatic)\n\n${reset}"
    fi
    if [ "$installPiper" = true ]
    then
        echo -e "${green}${bold}\n\nWill Install Piper Gaming Mouse\n\n${reset}"
    fi
    if [ "$installSwitchgraphics" = true ]
    then
        echo -e "${green}${bold}\n\nWill Install System76 GPU Switching\n\n${reset}"
    fi
    if [ "$installNvidiaDrivers" = true ]
    then
    echo -e "${green}${bold}\n\nWill Install Nvidia Drivers\n\n${reset}"
    fi

# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

    draw_progress_bar 0

    # UPDATE AND UPGRADE
    echo -e "${green}${bold}\n\nUpdating\n\n${reset}"
    sudo apt-get update
    draw_progress_bar 3
    echo -e "${green}${bold}\n\nUpgrading\n\n${reset}"
    sudo apt-get upgrade
    draw_progress_bar 7

    # CLI TOOLS
    echo -e "${green}${bold}\n\nInstalling git, wget, snapd, cmatrix, dconf-cli, dconf-editor, gnome-tweak-tool, zip, unzip, autohidetopbar, ffmpeg and hwinfo\n\n${reset}"
    sudo apt install git wget snapd cmatrix dconf-cli dconf-editor gnome-tweak-tool zip unzip gnome-shell-extension-autohidetopbar hwinfo ffmpeg
    echo -e "${green}${bold}\n\nAdding apt-repository universe\n\n${reset}"
    sudo add-apt-repository universe
    draw_progress_bar 10

    # INSTALL ZOOM
    echo -e "${green}${bold}\n\nInstalling Zoom\n\n${reset}"
    cd ~/Downloads/
    wget https://zoom.us/client/latest/zoom_amd64.deb
    sudo apt install ./zoom_amd64.deb
    rm -rf zoom_amd64.deb
    cd
    draw_progress_bar 21

    # INSTALL BARRIER
    echo -e "${green}${bold}\n\nInstalling Barrier\n\n${reset}"
    sudo snap install barrier
    draw_progress_bar 27

    # INSTALL BLENDER
    echo -e "${green}${bold}\n\nInstalling Blender\n\n${reset}"
    sudo snap install blender --classic
    draw_progress_bar 32

    # INSTALL PULSEEFFECTS
    echo -e "${green}${bold}\n\nInstalling PulseEffects\n\n${reset}"
    sudo add-apt-repository ppa:mikhailnov/pulseeffects
    sudo apt install pulseaudio pulseeffects --install-recommends
    draw_progress_bar 40

    # INSTALL VISUAL STUDIO CODE
    echo -e "${green}${bold}\n\nInstalling VSCode\n\n${reset}"
    sudo snap install code --classic
    draw_progress_bar 51

    # INSTALL OBS
    echo -e "${green}${bold}\n\nInstalling OBS\n\n${reset}"
    sudo add-apt-repository ppa:obsproject/obs-studio
    sudo apt install obs-studio
    draw_progress_bar 63

    # INSTALL THEMES
        # INSTALL APPS THEME
    echo -e "${green}${bold}\n\nInstalling Flat-Remix-GTK Application Themes\n\n${reset}"
    sudo add-apt-repository ppa:daniruiz/flat-remix
    sudo apt install flat-remix-gtk
    gsettings set org.gnome.desktop.interface gtk-theme 'Flat-Remix-GTK-Blue-Dark-Solid'

        # INSTALL CURSOR THEME
    echo -e "${green}${bold}\n\nInstalling WhiteSur-cursor Theme\n\n${reset}"
    cd Downloads
    git clone https://github.com/vinceliuice/WhiteSur-cursors.git
    cd WhiteSur-cursors
    sudo ./install.sh
    gsettings set org.gnome.desktop.interface cursor-theme 'WhiteSur-cursors'
    cd

        # INSTALL GNOME TERMIANL THEME
    echo -e "${green}${bold}\n\nInstalling Gnome Terminal Dracula Theme\n\n${reset}"
    cd Downloads
    git clone https://github.com/dracula/gnome-terminal
    cd gnome-terminal
    ./install.sh
    cd
    draw_progress_bar 67

    # CHANGING DOCK-TO-DOCK SETTINGS
    echo -e "${green}${bold}\n\nChanging Dock-to-Dock Settings\n\n${reset}"
    gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
    gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
    gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
    gsettings set org.gnome.shell.extensions.dash-to-dock transparency 0.3
    gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 56
    gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items true
    draw_progress_bar 78

    # CHANGE SCROLL DIRECTION
    echo -e "${green}${bold}\n\nChanging Scroll Direction\n\n${reset}"
    gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true
    echo -e "${green}${bold}\n\nTouchpad Scroll Direction Changed\n\n${reset}"
    gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true
    echo -e "${green}${bold}\n\nMouse Scroll Direction Changed\n\n${reset}"
    draw_progress_bar 80

    # CHANGE WALLPAPER
    echo -e "${green}${bold}\n\nChanging Wallpaper\n\n${reset}"
    cd Pictures
    wget https://github.com/Hello9999901/Customized-Ubuntu/raw/main/Media/abstract-smoke.jpg
    gsettings set org.gnome.desktop.background picture-uri 'file:///home/byran/Pictures/abstract-smoke.jpg'
    cd
    draw_progress_bar 86

    # CHANGE MIN, MAX, CLOSE POSITION FROM RIGHT TO LEFT
    echo -e "${green}${bold}\n\nChanging Position of Window (Close, Min, Max) Buttons From Right to Left\n\n${reset}"
    gsettings set org.gnome.desktop.wm.preferences button-layout close,minimize,maximize:
    draw_progress_bar 91

    # ADD WhiteSur FIREFOX THEME
    echo -e "${green}${bold}\n\Adding WhiteSur Firefox Theme into Downloads Folder\n\n${reset}"
    cd Downloads
    git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
    mv 'WhiteSur-gtk-theme/src/other/firefox/chrome/' 'Downloads/'
    rm -rf WhiteSur-gtk-theme
    mv Downloads chrome
    draw_progress_bar 99

    # AUTO-HIDE DOCK
    echo -e "${green}${bold}\n\Auto-hide the Dock\n\n${reset}"
    gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
    draw_progress_bar 100
    destroy_scroll_area
fi

#––––––––––––OPTIONAL INSTALLS––––––––––––––

if [ "$installRazer" = true ]
then
    enable_trapping
    setup_scroll_area
    draw_progress_bar 0
    echo -e "${green}${bold}\n\nInstalling Razer Software (Polychromatic)\n\n${reset}"
    # Install Linux-Headers
    sudo apt install linux-headers-5.8.0-41-lowlatency
    draw_progress_bar 30
    # Install OpenRazer Daemon
    sudo add-apt-repository ppa:openrazer/stable
    draw_progress_bar 50
    sudo apt install openrazer-meta
    draw_progress_bar 80
    # Install Polychromatic GUI
    sudo add-apt-repository ppa:polychromatic/stable
    draw_progress_bar 90
    sudo apt install polychromatic
    draw_progress_bar 100
    destroy_scroll_area
fi


if [ "$installPiper" = true ]
then
    enable_trapping
    setup_scroll_area
    draw_progress_bar 0
    echo -e "${green}${bold}\n\nInstalling Piper Gaming Mouse Software\n\n${reset}"
    sudo apt install piper
    draw_progress_bar 100
    destroy_scroll_area
fi


if [ "$installSwitchgraphics" = true ]
then
    enable_trapping
    setup_scroll_area
    draw_progress_bar 0
    echo -e "${green}${bold}\n\nInstalling System76 GPU Switching Software\n\n${reset}"
    sudo apt-add-repository ppa:system76-dev/stable
    draw_progress_bar 50
    sudo apt install gnome-shell-extension-system76-power system76-power
    draw_progress_bar 100
    destroy_scroll_area
fi


if [ "$installNvidiaDrivers" = true ]
then
    enable_trapping
    setup_scroll_area
    draw_progress_bar 0
    echo -e "${green}${bold}\n\nINSTALL NVIDIA DRIVERS\n\n${reset}"
    sudo ubuntu-drivers autoinstall
    draw_progress_bar 100
    destroy_scroll_area
fi

# REBOOT (MUST BE LAST STEP)
if [ "$normalInstall" = true ] 
then
    echo -e "${green}${bold}\n\nDo you want to reboot now? (Yes/No)${reset}"
    read reboot
    if [ "$reboot" = "Yes" ]
    then
        echo -e "${green}${bold}\n\nREBOOTING\n\n${reset}"
        sudo reboot
    else
        echo -e "${green}${bold}\n\nThank You for Using Byran Technologies Applications! Please Restart to Your Closest Convenience.${reset}"
    fi
else
    true
fi
