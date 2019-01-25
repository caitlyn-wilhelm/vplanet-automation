#!/usr/bin/bash
#---------------------------------------------------

# set -xv

#---------------------------------------------------
clear

#---------------------------------------------------
# Set project working directory

cd ~/Projects/IceBelt

#---------------------------------------------------
source ~/vplanet-automation/bin/get_vspace.sh

#----------------------------------------------------
# Checks if the destination folder already exists, and if it does asks if user wants to override it

if [[ -e $DESTFOLDER ]]
then
	read -p "$DESTFOLDER already exists. Do you want to override it? [y/n]" answer
	while true
	do
		case $answer in
			[yY]* )
  				echo "Get ready to create files..."
				echo "Runnning vspace..."
				vspace $VSPACE_FILE
     			break;;

			[nN]* ) exit;;

			* )     echo "Enter Y or N, please."; break ;;
		esac
	done
else
	echo "Get ready to create files..."
	echo "Runnning vspace..."

	vspace $VSPACE_FILE
fi

#--------------------------------------------------
# After vspace is done,it continues to do the Vplanet.sh code

echo "Starting Vplanet Process"
source ~/vplanet-automation/bin/vplanet.sh

#--------------------------------------------------
