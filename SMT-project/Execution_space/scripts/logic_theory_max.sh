#!/bin/bash
#A script for collecting the category maximums from several files within a folder and its subfolders

#make a file with zeroes to compare with the values of this file and update if a new maximum is found


awk 'BEGIN{while(i++<=35){print "0"}}' > newfile.txt

cat newfile.txt
counter=1

for i in $(find . -name "top_values.txt")

#look for all files named top_values.txt within the scope

do
    
counter=$($counter+1)
    
#kolla in globala och logikspecifika maxima, och presentera de samlade maxima i en modifierad 'top_values.txt'
    
echo $i > counter.txt

    
#använd 
    


    

#if [[ $files ]]; then #does this mean not empty? i.e. result

#fi
done

$counter > counter.txt

