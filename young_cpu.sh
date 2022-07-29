#!/bin/bash -l
#  SELECT 40, 80, 120, ... CORES
#$ -pe mpi 120
#$ -l mem=4G
#$ -N bovlact
#$ -cwd
#$ -l h_rt=48:00:00
#$ -P Gold
#$ -A KCL_Lorenz
​
module purge
module load gcc-libs
module load compilers/intel/2018/update3/
module load mpi/intel/2018/update3/intel
module load gerun
module load gromacs/2019.3/intel-2018
​
# INPUT FILE NAMES
gerun mdrun_mpi -v -deffnm step6_2 -cpi step6_4.cpt -cpo step6_5.cpt -noappend
