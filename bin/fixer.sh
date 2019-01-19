#!/usr/bin/bash
#---------------------------------------------------

#---------------------------------------------------
# Set variables
        
correct=0
corrupt=0

#---------------------------------------------------
# Find all tilted.earth.forward files in the directory
# provided by $1

for tef_file in $(find $1 -name tilted.earth.forward)
do

    #-----------------------------------------------
    # Check totla lines in file equal to total uniq 
    # lines in file
    
    if [ $(cat $tef_file | wc -l) -eq $(cat $tef_file | sort | uniq | wc -l) ]
    then
        echo -e "$tef_file ... correct"
        correct=$(( correct + 1 ))
    else
        echo -e "$tef_file ... corrupt"
        corrupt=$(( corrupt + 1 ))
        
        #-------------------------------------------
        # Fix corrupt files
                 
        if [[ "$2" == "f" ]]
        then
            cd $(dirname $tef_file)
            vplanet vpl.in
        fi
    fi
done

#---------------------------------------------------
# Print totals

echo
echo -e "Correct files: $correct"
echo -e "Corrupt files: $corrupt"
echo

#---------------------------------------------------

