#!/bin/bash

#awk 'BEGIN{while(i++<=35){print "0"}}' | datamash transpose > newfile.txt

#look for all files named top_values.txt within the scope
for i in $(find . -name "result.txt")
	 
do
#extracting the status values from each result file. appending them all as a column in a file. 
    cat $i | sed -n '2,$p' | awk '{print $37}' | cut -d, -f1 >> status_temp.txt
    cat $i | sed -n '2,$p' | awk '{print $38}' | cut -d, -f1 >> time_temp.txt
    cat $i | sed -n '2,$p' | cut -d, -f2-36  >> raw_temp.txt
    
done
#sorting and counting the occurance of each status value within the file. presenting it as a small table.

cat status_temp.txt | sort | uniq -c > status_count.txt
echo "out of : " >> status_count.txt
wc -l time_temp.txt | cut -d' ' -f1 >> status_count.txt

cat time_temp.txt | sort | datamash -H max 1 mean 1 median 1 > time_count.txt

cat raw_temp.txt | sed 's/,//g' | datamash -W median 1 median 2 median 3 median 4 median 5 median 6 median 7 median 8 median 9 median 10 median 11 median 12 median 13 median 14 median 15 median 16 median 17 median 18 median 19 median 20 median 21 median 22 median 23 median 24 median 25 median 26 median 27 median 28 median 29 median 30 median 31 median 32 median 33 median 34 median 35 | datamash transpose >> median_temp.txt
paste header.txt median_temp.txt | column -t > median.txt


cat raw_temp.txt | sed 's/,//g' | datamash -W mean 1 mean 2 mean 3 mean 4 mean 5 mean 6 mean 7 mean 8 mean 9 mean 10 mean 11 mean 12 mean 13 mean 14 mean 15 mean 16 mean 17 mean 18 mean 19 mean 20 mean 21 mean 22 mean 23 mean 24 mean 25 mean 26 mean 27 mean 28 mean 29 mean 30 mean 31 mean 32 mean 33 mean 34 mean 35 | datamash transpose >> mean_temp.txt
paste header.txt mean_temp.txt | column -t > mean.txt


rm status_temp.txt time_temp.txt raw_temp.txt




#if [ $1 -ge 100 ]
#then
#	echo hey, that\'s a large number!
#	if (($1 % 2 == 0))
#	then
#		echo also, it\'s an even number.
#	fi
#fi
