#!/usr/bin/bash
#---------------------------------------------------
# Checks all tilted.log files to validate 
# that 'FINAL SYSTEM PROPERTIES' exists.
#---------------------------------------------------
# Set Variables
total=$(($2 * $2))
found=0
missing=0

#---------------------------------------------------
# Find all tilted.log files in directory
# passed in for $1

for tl_file in $(find $1 -name tilted.log)
do

    #-----------------------------------------------
    # Determine if 'FINAL SYETEM PROPERTIES' exists
    # in tilted,log file
    # '---FINAL SYSTEM PROPERTIES ----'
    
    if grep "FINAL SYSTEM PROPERTIES" $tl_file >/dev/null
    then
        found=$(( found + 1 ))
    else
        missing=$(( missing + 1 ))
    fi
done

#---------------------------------------------------
# Print totals

echo
echo -e "Files found: $found"
echo -e "Missing 'FINAL SYSTEM PROPERTIES': $missing"
echo

#---------------------------------------------------
# Return results

if [[ $found == $total ]]
then
    exit 0
else 
    exit 1
fi
   
#---------------------------------------------------

