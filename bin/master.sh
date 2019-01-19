#!/usr/bin/bash

#---------------------------------------------------
clear

BLACK="\033[30m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
PINK="\033[35m"
CYAN="\033[36m"
WHITE="\033[37m"
NORMAL="\033[0;39m"
PURPLE='\e[1;35m'

#---------------------------------------------------
# Set project working directory

cd ~/PreMAP2016/Project

#---------------------------------------------------
# Main menu display 

echo -e "$PURPLE"
cat ~/code_stuff/ascii_art/welcome.txt

# cat ./ascii_art/you_are_here.txt

echo "Choose one of the options below to start the automation process"

echo ""
echo -e "$GREEN[Ss] for Vspace set up"
echo -e "$WHITE[Pp] for Running Vplanet"
echo -e "$CYAN[Cc] for Contour Plot"
echo -e "$NORMAL"

read -p "Enter run option: " answer

while true
do
    case $answer in
    [Ss])
        echo "Starting Vspace Process..."
        source ~/code_stuff/vspace.sh
        break;;

     [Pp])
        echo "Starting Vplanet Process..."
        source ~/code_stuff/vplanet.sh
        break;;

     [Cc])
        echo "Starting Contour Plot Creation..."
        source ~/code_stuff/contour_plots.sh
        break;;

     * )     
        echo "Exiting"; break ;;
    esac
done

#--------------------------------------------------

