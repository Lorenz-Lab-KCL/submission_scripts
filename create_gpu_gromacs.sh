#!/bin/bash -l
#SBATCH --job-name=r2-T310-lca1
#SBATCH --gres=gpu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --gpus-per-node=1
#SBATCH --mem=7G
#SBATCH --time=2-00:00

module load gromacs_kcl/2021.5-gcc-9.4.0-cuda-11.5.0
export OMP_NUM_THREADS=32
gmx mdrun -v -deffnm step7_1_r2 -cpi step7_3_r2.cpt -cpo step7_4_r2.cpt -noappend -pin on -nb gpu -pme gpu -bonded gpu -nt 32
