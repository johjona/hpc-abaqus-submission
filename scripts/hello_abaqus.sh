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

cat $0

cp -p new_input.inp $SNIC_TMP

cd $SNIC_TMP

module add abaqus/V6R2023x

abaqus job=new_input memory=60000MB cpus=20 scratch=. interactive

cp -p *.* $SLURM_SUBMIT_DIR

