# Introduction to Abaqus job submission on hpc cluster via SLURM

This repository contains some basic files to get started with job submission via SLURM on the Lunarc HPC cluster. 

## Cloning this directory with git

You can clone this directory to your local machine/cluster by opening a terminal of your choice and execute the following command:
```
git clone git@github.com:johjona/hpc-abaqus-submission.git
```
Change the current directory with the following command
```
cd /home/username/yourpath/hpc-abaqus-submission
```
Now we can start submitting some jobs to the cluster, but let's first look at the structure of this project.

## Project structure

The structure of this projects like like this:
```
├── logs
│   └── new_input.sta
├── misc
│   └── linux_comands.txt
├── new_input.inp
├── README.md
└── scripts
    ├── elastic_console_beam.inp
    ├── hello_abaqus_output.sh
    ├── hello_abaqus.sh
    ├── hello_world.sh
    └── new_input.inp
```
We have three foldres: logs, misc, and scripts. 

### logs - In this directory we can save files from our abaqus jobs. For example, when we later run an Abaqus simulation, we continously copy the sta-file to this directory to monitor e.g. the time step convergence in real time.

### scripts - Here we put all our batch scripts, and our input files to abaqus.

### misc - I put some linux commands in a text-file for quick reference.

For more info on using Abaqus on Lunarc cluster, see: https://lunarc-documentation.readthedocs.io/en/latest/guides/applications/Abaqus/

## Submitting your first job to the SLURM queue system

We will first submit a batch script that submits a very simple job, and only print "Hello World". The batch script is called "hello_world.sh" and is located in the scripts directory. Navigate into the scripts directory:
```
cd scripts/
```
Some other related to changing directory:
```
cd ~
```
navigates into the root directory, which generally is ```/home/user_name/```
Submit the job to the SLURM queue system with the following:
```
sbatch hello_world.sh
```
The SLURM manager will give the job a number. To monitor how the SLURM queue looks right now you can use:
```
squeue
```
If you combine it with the flag -u, you can get only your own job submissions, instead of the entire queue.
```
squeue -u user_name
```
You can cancel a specific job with
```
scancel slurm_job_id
```
You can also cancel all your current jobs by using the user name flag:
```
scancel -u jo1623jos
```
When the job is finished slurm will output a file ```slurm-slurm_job_id.out```. This file contains the output from the script, which in this case is "Hello world".

## Submitting an Abaqus job

The submission of an Abaqus job is slightly more convoluted, and we need to specify more things than we did for the "Hello world"-script. 

There are two abaqus scipts. The first one submits a linear elastic analaysis of a console beam. The second analysis is a nonlinear analysis of a beam that undergoes fracture. This batch script also includes some code which continously copies the information in the .sta file to the /logs/. If you navigate into this folder with
```
cd ../logs/
```
Here ```../``` tells us that we want to look in the directory above the current directory. In this directory we then switch to ```logs/```. 

If we then use

```
tail -f new_input.sta
```
we get a real-time continous printing of the sta-file which contains the information from every time-step during the simulation.






