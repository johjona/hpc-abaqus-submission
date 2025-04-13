#!/bin/bash
#SBATCH -t 1:00:00

# Number of nodes
#SBATCH -N 1
#SBATCH --exclusive

#SBATCH --ntasks-per-node=20
#SBATCH -J Hello_Abaqus_HPC_World

#SBATCH -o process_%j.out
#SBATCH -e process_%j.err

#SBATCH --mail-user=johannes.jonasson@construction.lth.se
#SBATCH --mail-type=START,END

module load GCCcore/13.3.0
module load Python/3.12.3

python -m job_submission_via_python
