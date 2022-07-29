#!/bin/bash
​
#SBATCH --job-name=dmpc_h2o
#SBATCH --cpus-per-task 36
#SBATCH --mem=10G
#SBATCH --partition=landau
​
​
# load modules
module load gromacs2019.2-float-gcc7.3.0-cuda10.1-avx2_256
​
#run with srun or mpirun
gmx grompp -f step6.0_minimization.mdp -o step6_0.tpr -c step5_input.gro -r step5_input.gro -p topol.top -n index.ndx -maxwarn 1
srun gmx mdrun -v -deffnm step6_0
gmx grompp -f step6.1_equilibration.mdp -o step6_1.tpr -c step6_0.gro -r step5_input.gro -p topol.top -n index.ndx
srun gmx mdrun -v -deffnm step6_1
gmx grompp -f step6.2_equilibration.mdp -o step6_2.tpr -c step6_1.gro -r step5_input.gro -p topol.top -n index.ndx
srun gmx mdrun -v -deffnm step6_2
gmx grompp -f step6.3_equilibration.mdp -o step6_3.tpr -c step6_2.gro -r step5_input.gro -p topol.top -n index.ndx
srun gmx mdrun -v -deffnm step6_3
gmx grompp -f step6.4_equilibration.mdp -o step6_4.tpr -c step6_3.gro -r step5_input.gro -p topol.top -n index.ndx
srun gmx mdrun -v -deffnm step6_4
gmx grompp -f step6.5_equilibration.mdp -o step6_5.tpr -c step6_4.gro -r step5_input.gro -p topol.top -n index.ndx
srun gmx mdrun -v -deffnm step6_5
gmx grompp -f step6.6_equilibration.mdp -o step6_6.tpr -c step6_5.gro -p topol.top -n index.ndx
srun gmx mdrun -v -deffnm step6_6
gmx grompp -f step7_production.mdp -o step7_0.tpr -c step6_6.gro -p topol.top -n index.ndx
srun gmx mdrun -v -deffnm step7_0
