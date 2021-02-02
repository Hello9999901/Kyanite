echo -e "${green}${bold}\n\nAre you SURE you want to install all the application and utilities listed in the README.md? (Yes/No)"
read install
if [ "$install" = "Yes" ]
then
    echo "INSTALLING"
else
    exit
fi