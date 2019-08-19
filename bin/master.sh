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

cd $Proj_Dir

#---------------------------------------------------
# Main menu display

echo "Choose one of the options below to start the automation process"

echo ""
echo -e "$GREEN[1] for Vspace set up"
echo -e "$WHITE[2] for Running Vplanet"
echo -e "$RED[3] for Setup options"
echo -e "$NORMAL"

read -p "Enter run option: " answer

while true
do
    case $answer in
    [1])
        echo "Starting Vspace Process..."
        source ~/vplanet-automation/bin/vspace.sh
        break;;

     [2])
        echo "Starting Vplanet Process..."
        source ~/vplanet-automation/bin/vplanet.sh
        break;;

     [3])
        echo "Starting Setup Process..."
        source ~/vplanet-automation/bin/setup.sh
        break;;

     * )
        echo "Exiting"; break ;;
    esac
done

#--------------------------------------------------
