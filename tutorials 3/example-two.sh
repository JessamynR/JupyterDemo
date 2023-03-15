#!/bin/bash
### Job Parameters:
#SBATCH --job-name  "Arguments" # display name
#SBATCH --output    "out.log"   # where to log terminal output 
#SBATCH --error     "err.log"   #  .. and error messages
#SBATCH --open-mode truncate    # always overwrite log files 

# Resources required
#SBATCH --ntasks 1          # number of tasks we'll perform
#SBATCH --cpus-per-task 2   # num. cpus each task will require
#SBATCH --mem-per-cpu 128   # memory required per cpu (in megabytes)

### Script To Execute:
for item in "$@"; do # loop provided arguments.
    # print the length of the argument (as a string)
    echo -n "The argument '${item}' is ${#item} characters long. "
    # and then do something random...
    amount=$((RANDOM % 6))   # choose `amount` to sleep
    sleep 0.${amount}        # sleep for `amount/10` seconds
    echo "Slept for 0.${amount} seconds."
done