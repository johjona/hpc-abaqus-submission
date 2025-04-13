#!/bin/bash
#SBATCH -t 00:01:00

# Number of nodes
#SBATCH -N 1
#SBATCH --exclusive

#SBATCH --ntasks-per-node=20
#SBATCH -J Hello_Abaqus_HPC_World

#SBATCH -o process_%j.out
#SBATCH -e process_%j.err

#SBATCH --mail-user=johannes.jonasson@construction.lth.se
#SBATCH --mail-type=START,END

echo "Running slurm job"

sleep 30
