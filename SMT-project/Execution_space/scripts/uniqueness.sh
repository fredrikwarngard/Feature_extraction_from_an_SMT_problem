#!/bin/bash
#A script for analyse the result files from scrambler

#Takes the results from result file, exclude headline category line / Removes problem names / Sort? / Exclude identical copies? / Sort -n?
#old_version
#sed -n '2,$p' result_sage.txt | cut -d, -f2- | sort | uniq -c | sort -n > Latest_results/unique.txt

#new_version
mkdir Unique_results

for i in $(find . -name "result.txt")
	 
do
#extracting the status values from each result file. appending them all as a column in a file. 
    cat $i | sed -n '2,$p' | cut -d, -f2-37  >> Unique_results/raw_temp.txt    
done

#Remove runtime column and count occurances of unique problem features, then remove duplicates.
cat Unique_results/raw_temp.txt | sort | uniq -c | sort -n > Unique_results/unique_incl_status.txt
cat Unique_results/raw_temp.txt | rev | cut -f2- -d',' | rev | sort | uniq -c | sort -n > Unique_results/unique_excl_status.txt


#Presenting the grouping of unique problem feature data. How many data sets are only represented by one problem? How many by two? And so on.
sed 's/[^ ]*,.*//' Unique_results/unique_incl_status.txt | uniq -c | sed 's/\([ ]*[0-9]*\)\([ ]*[0-9]*\)/\2\1/' >> Unique_results/clusters_incl_status.txt
sed 's/[^ ]*,.*//' Unique_results/unique_excl_status.txt | uniq -c | sed 's/\([ ]*[0-9]*\)\([ ]*[0-9]*\)/\2\1/' >> Unique_results/clusters_excl_status.txt

rm Unique_results/raw_temp.txt
