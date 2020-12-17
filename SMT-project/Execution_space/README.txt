Scripts are found in the "scripts" folder. Place one directly in the Execution_space and not in a subfolder to run it.


To run the benchmarks:
Make sure that the scrambler program and that the run_scrambler are both in the Execution_space folder, and not in a subfolder.

1. Place Benchmark Folder you want to run within the folder named "Current_Benchmark_Folder".

2. Simply run the 'run_scrambler' script as ./run_scrambler. The benchmark in the folder will then execute.

3. Manually add the name of the benchmark folder to the name of the 'runtime_result' folder.


----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

To process the results:

[1]process_result: sorts and collects bulk of raw data
Keep the result.txt file in the Execution_space folder but not in a subfolder

run script with ./process_result and the file named result.txt will be executed upon.
Outputs	reduced_raw.txt
	max_mean_median_runtimes.txt
	unique.txt
	clusters.txt
	maximum_values.txt

---------------------------------------------------------------------------------

[2]logic_theory_max: looks for maximum values from each respective category from all feature counts within the benchmarks
Looks recursively for files named "top_values.txt", so don't keep other files named that in any subfolders.

run script with ./logic_theory_max and the top_values.txt file will be executed upon.
Outputs	altogether_top_values.txt

---------------------------------------------------------------------------------

[3]example_script.sh: a bad named for a script, but it organizes the status distribution, runtimes, median and mean values on the input.
Looks recursively for files named "result.txt", so don't keep other files named that in any subfolders unless you want the script to include them.

run script with ./example_script.sh and the file named result.txt will be executed upon.
Outputs	status_count.txt
	time_count.txt
	meadian.txt
	mean.txt

--------------------------------------------------------------------------------

[4]uniqueness.sh: finds the problems with identical feature extraction counts and place them in clusters. Presents the size of the clusters and how many clusters there are of each size
Looks recursively for files named "result.txt", so don't keep other files named that in any subfolders unless you want the script to include them.

run script with ./uniqueness.sh and the file named result.txt will be executed upon.
Outputs	clusters_incl_status.txt
	clusters_excl_status.txt
 
