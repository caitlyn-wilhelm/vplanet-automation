#!/bin/bash
#---------------------------------------------------

set -x

#---------------------------------------------------
clear

#---------------------------------------------------
# Set project working directory

cd ~/PreMAP2016/Project

#---------------------------------------------------
source ~/code_stuff/get_vspace.sh

~/code_stuff/fsp_checker.sh $DESTFOLDER $NUM

#---------------------------------------------------
# if vplanet has NOT ran completely

if [[ $? -eq 1 ]]
then
    nohup ~/code_stuff/run_vplanet.py $DESTFOLDER &> $DESTFOLDER.out &
    wait
fi
		
if [[ $YAXIS == "A" ]]
then
    ~/code_stuff/config_contour.py $DESTFOLDER $SUB $NUM $YAXIS $VSPACE_FILE $YMIN $YMAX &> $DESTFOLDER.out &
    wait
fi

if [[ $YAXIS = "S" ]]
then
    ~/code_stuff/config_contour.py $DESTFOLDER $SUB $NUM $YAXIS $VSPACE_FILE &> $DESTFOLDER.out &
    wait
fi

echo ""
echo "deleting output file..."
echo ""
rm $DESTFOLDER.out

echo ""
echo "Your plot has been created in contour plot folder, and is being emailed now"
echo ""

#mail -a ~/PreMAP2016/Project/contour_plots/images/normal/$DESTFOLDER.png -s "Coding Process for $DESTFOLDER is complete" cwilhelm@uw.edu <<< "The contourplot for $DESTFOLDER is attatched, please inspect the contour plot for errors and/or anomalies, then return to the Astrolab servers to make the next coding process"


#--------------------------------------------------

