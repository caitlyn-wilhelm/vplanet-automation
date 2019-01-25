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

cd ~/Project

#---------------------------------------------------
# Main menu display

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
        source vplanet-automation/bin/vspace.sh
        break;;

     [Pp])
        echo "Starting Vplanet Process..."
        source vplanet-automation/bin/vplanet.sh
        break;;

     [Cc])
        echo "Starting Contour Plot Creation..."
        source vplanet-automation/bin/contour_plots.sh
        break;;

     * )
        echo "Exiting"; break ;;
    esac
done

#--------------------------------------------------
