#!/bin/bash

#SBATCH --job-name=tba2
#SBATCH --nodes=4
#SBATCH --ntasks=512
#SBATCH --tasks-per-node=128
#SBATCH --cpus-per-task=1
#SBATCH --time=24:00:00

#SBATCH --account=e05-biosoft-lor

#SBATCH --partition=standard
#SBATCH --qos=standard

module load gromacs/2021.3

export OMP_NUM_THREADS=1

#gmx grompp -f ../step4.1_equilibration.mdp -o step4_1.tpr -c min.gro -p f8bt_psma_tba_2_ions.top -n f8bt_psma_tba_2_ions.ndx -maxwarn -1
#srun gmx_mpi mdrun -deffnm step4_1
#gmx grompp -f ../step5_production.mdp -o step5_0.tpr -c step4_1.gro -p f8bt_psma_tba_2_ions.top -n f8bt_psma_tba_2_ions.ndx -maxwarn -1
srun gmx_mpi mdrun -deffnm step5_0 -cpi step5_11.cpt -cpo step5_12.cpt -noappend
