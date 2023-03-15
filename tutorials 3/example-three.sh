#!/bin/bash
### Job Parameters:
#SBATCH --job-name "Recursive"     # job name
#SBATCH --output   "recursive.log" # place to log output
#SBATCH --open-mode append         # always append to logs
#SBATCH --begin     now+10         # specify when the job should start
                                   # .. (waits 10 seconds after submission)
### Script To Execute:
# print job detials
echo "Running job $SLURM_JOB_ID"
echo "Batch script file: $0"

# submit new job using *this* script (recursion)
sbatch "$0"