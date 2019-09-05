#!/usr/bin/bash

#---------------------------------------------------

echo
echo "Choose one of the options below"

echo ""
echo -e "$GREEN[1] for Changing Project Directory"
echo -e "$RED[2] to return to menu"
echo -e "$NORMAL"

read -p "Enter run option: " answer

while true
do
    case $answer in
    [1])
        echo "Changing Project Directory..."
        echo
        read -p "Enter new Project Directory: " PD
        export PD=$Proj_Dir
        break;;

     [2])
        source ~/vplanet-automation/bin/master.sh
        break;;

     * )
        echo "Exiting"; break ;;
    esac
done
