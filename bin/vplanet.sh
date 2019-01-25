#!/usr/bin/bash
#---------------------------------------------------

#set -xv

#---------------------------------------------------
clear

#---------------------------------------------------
# Set project working directory

cd ~/Projects/IceBelt

#---------------------------------------------------
#runs Vplanet function

source ~/vplanet-automation/bin/get_vspace.sh

vplanet-automation/bin/fsp_checker.sh $DESTFOLDER $NUM

#---------------------------------------------------
# if vplanet has ran completely

if [[ $? -eq 0 ]]
then
	read -p "It looks like Vplanet has been run for $DESTFOLDER. Do you want to override it? [y/n]" answer
	while true
		do
		case $answer in
      		[yY] )
	    		echo "Get ready to do simulations!"
	    		echo "Running vplanet..."
	     		nohup ~/vplanet-automation/bin/run_vplanet.py $DESTFOLDER True &> $DESTFOLDER.out &
	     		wait
	       		break;;

			[nN] )
				exit;;

			* )
				echo "Enter Y or N, please."
				break;;
      		esac
  	done

#---------------------------------------------------
# if vplanet has not been run at all or did not finish
else
	echo "Get ready to do simulations!"
	echo "Running vplanet..."
	nohup vplanet-automation/bin/run_vplanet.py $DESTFOLDER &> $DESTFOLDER.out &
	wait
fi


vplanet-automation/bin/fixer.sh $DESTFOLDER f

echo ""
echo "Everything is done!"
echo ""

#---------------------------------------------------
# Checks to see if vplanet actually ran
~/vplanet-automation/bin/fsp_checker.sh $DESTFOLDER $NUM

#---------------------------------------------------
# if vplanet has NOT ran completely

if [[ $? -eq 1 ]]
then
    nohup ~/vplanet-automation/bin/run_vplanet.py $DESTFOLDER &> $DESTFOLDER.out &
    wait
fi

echo ""
echo "deleting output file..."
echo ""
rm $DESTFOLDER.out

mail -s " Coding Process has finished for $DESTFOLDER" cwilhelm@uw.edu <<< "Please log into the Astrolab and make the plot since the code you wrote sucks and its still broken (AKA please fix the code ASAP so you actually get the plots instead of doing this manually every time)"
#echo "Starting Contourplot Process"
#source ~/code_stuff/contour_plots.sh

#--------------------------------------------------
