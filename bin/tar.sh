#!/bin/bash
#---------------------------------------------------

#set -x

#---------------------------------------------------
clear

#---------------------------------------------------
# Set project working directory

cd /astro/store/faculty1/rkb9/cwilhelm/PreMAP2016/Project

#---------------------------------------------------
source ~/code_stuff/get_vspace.sh

~/code_stuff/fsp_checker.sh $DESTFOLDER $NUM

#---------------------------------------------------
# if vplanet has NOT ran completely

if [[ $? -eq 1 ]]
then
    clear
    echo ""
    echo "Vplanet has not been run completely. Please try again once it has been run correctly"
    echo ""
    exit
fi

cd ~/Project/IceBelts/contourplot/lists
if [[ ! -e list_$DESTFOLDER ]]
then
    clear
    echo ""
    echo "You cannot delete the folder without a list file being present. Please try again after creating a list file"
    echo ""
    exit
fi

cd /astro/store/faculty1/rkb9/cwilhelm/PreMAP2016/Project

tar -zcf $DESTFOLDER.tar.gz
rm -r $DESTFOLDER
