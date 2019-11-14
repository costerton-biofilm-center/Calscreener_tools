# Calscreener_tools
Scripts for manipulating Calscreener data

# Files 

```time_MaxPeak_script.R```: This script will take ```testdata.csv```, which is an example of Heat Transfer data from a Calscreener run and return the Time (in seconds or hours) of the first occurance of the maximum heat transfer value and outputs the results as a comma delimited text file with the prefix ```_out```

Note: The user must manually set the sample names in the R script and all columns must have the same number of rows. 

```testdata.csv```: This is an example set of test data

```testdata_out_example.csv```: This should be the correct output.

```testdata.csv_out.csv```: This is the output of ```testdata.csv```. It will probably be overwritten when you run the script. 

# To run the script:

1. Download and unzip the repository.
2. Open the script in R and set the working directory to the location of the example files. 
3. Press source to run the analysis. 

