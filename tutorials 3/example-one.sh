#!/bin/bash
### Job Parameters:  
#SBATCH --job-name "My Letter"     # job's name
#SBATCH --output   "letter.%j.log" # output log (%j gets replaced with job's id)
#SBATCH --comment  "A humble job." # comment about job

### Script To Execute:
amount=$((30 + RANDOM % 60)) # number between 30 and 90
memory=$((SLURM_MEM_PER_CPU * SLURM_CPUS_PER_TASK * 1024 * 1024))
draft=(" Dear ${USER},\n\n"
       "  I hope this letter finds you well; it is a glorious $(date +%A)\n"
       "in $(date +%B) and I find myself executing on "$(hostname -s)" with\n"
       "access to ${memory} bytes of memory and $(nproc) cpu(s). Knowing that\n"
       "these resources are shared, I have chosen to surrender ${amount}\n"
       "seconds of my alloted time to processes less fortunate than I.\n\n"
       "Cheers,\n" "  Job ${SLURM_JOB_ID}\n")

# send letter & take a nap.
echo -e "${draft[@]}" && sleep ${amount}