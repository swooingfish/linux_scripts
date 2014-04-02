#!/bin/sh

# Source : http://stackoverflow.com/questions/9590935/change-extension-of-file-using-shell-script
# Script, first finds the names of the given extensions. It removes the extension from names. Then adds 
# backslash() for identification of terminal.
# Then the 'mv' command executed. Here the '.temp' folder is used to hide the process from user, in GUI

# The output files are saved inside the '.temp' folder,later the '.temp' folder is removed.

if [ $# -ne 3 ] 
then
    echo "Usage:  ./script folder current_extension modify_extension"
    echo "e.g:  ./rename_extension.sh ./ JPG jpg"
    exit
fi
mkdir .temp
find $1 -name "*.$2" > .temp/output_1 && sed "s/$2//" .temp/output_1 > .temp/output_2 && sed -e "s/[ \t]/\\\ /g" .temp/output_2 > .temp/output_3
while read line
do
    mv -v "$line""$2" "$line""$3"
done < .temp/output_3
rm -rf .temp