#!/usr/bin/bash
#---------------------------------------------------

#---------------------------------------------------
# Checks if VSPACE_FILE has a file in it or not, if absent prompt for file.

if [[ -z $VSPACE_FILE ]]
  then
    read -p "Enter vspace file: " VSPACE_FILE
fi

#---------------------------------------------------
# Check to see if file exists
if [[ -e $VSPACE_FILE ]]
then
	echo "VSPACE_FILE : $VSPACE_FILE"
    SEMI=$(grep ^dSemi $VSPACE_FILE)
    LUM=$(grep ^dLuminosity $VSPACE_FILE)

    if [[ $SEMI == *'['*']'* ]]
    then
        YAXIS="A"
        YMIN=$(echo $SEMI | tr -d '[,]' | awk '{print $2}')
        YMAX=$(echo $SEMI | tr -d '[,]' | awk '{print $3}')
    fi

    if [[ $LUM == *'['*']'* ]]
    then
        YAXIS="S"
    fi

    #---------------------------------------------------
    # assigns the destination folder to a variable

    DESTFOLDER=$(grep ^destfolder $VSPACE_FILE | awk '{print $2}')

    #---------------------------------------------------
	# assigns the grid witdth/length to a variable

	# NUM=$(grep "[*,*,*]" $VSPACE_FILE | tr -d '[]' | cut -f2 -d 'n' | awk '{print $1}')
    NUM=$(grep "\[*,*,*\]" $VSPACE_FILE | tr -d '[]' | cut -f2 -d'n' | awk '{print $1}' | sort -u)

    DIM=$(grep n$NUM $VSPACE_FILE | wc -l | awk '{print $1}')

    #---------------------------------------------------
	# assigns name of subfolders to a variable

	SUB=$(grep ^trialname $VSPACE_FILE | awk '{print $2}')

fi

#---------------------------------------------------
# Print variables from VSPACE_FILE

echo "DESTFOLDER : $DESTFOLDER"
echo "NUM : $NUM"
echo "SUB : $SUB"
echo "DIM : $DIM"

#---------------------------------------------------
