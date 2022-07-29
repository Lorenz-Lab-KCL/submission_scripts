#!/bin/bash

#SBATCH --job-name=T298_lca2
#SBATCH --mail-type=END

# Number of tasks
#SBATCH -n 1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node 1

# Selct the partitions to be used
#SBATCH -p physgpu

# Select GPU ID: 0 or 1
module load gromacs2019.2-float-gcc7.3.0-cuda10.1-avx2_256
#gmx grompp -f /home/stwb3922/sharedscratch/dota_membranes/w_glucose_NaCl/T_298K/step6.0_minimization.mdp -o step6_0.tpr -c lca1_glucose_ions.gro -r lca1_glucose_ions.gro -p lca1_glucose_ions.top -n lca1_glucose_ions.ndx
#srun gmx mdrun -v -deffnm step6_0 -gpu_id 0 -pin on -nb gpu -pme gpu -pmefft gpu -bonded gpu -nt 1
#gmx grompp -f /home/stwb3922/sharedscratch/dota_membranes/w_glucose_NaCl/T_298K/step6.1_equilibration.mdp -o step6_1.tpr -c step6_0.gro -r lca1_glucose_ions.gro -p lca1_glucose_ions.top -n lca1_glucose_ions.ndx
#srun gmx mdrun -v -deffnm step6_1 -gpu_id 0 -pin on -nb gpu -pme gpu -pmefft gpu -bonded gpu -nt 1
#gmx grompp -f /home/stwb3922/sharedscratch/dota_membranes/w_glucose_NaCl/T_298K/step6.2_equilibration.mdp -o step6_2.tpr -c step6_1.gro -r lca1_glucose_ions.gro -p lca1_glucose_ions.top -n lca1_glucose_ions.ndx
#srun gmx mdrun -v -deffnm step6_2 -gpu_id 0 -pin on -nb gpu -pme gpu -pmefft gpu -bonded gpu -nt 1
#gmx grompp -f /home/stwb3922/sharedscratch/dota_membranes/w_glucose_NaCl/T_298K/step6.3_equilibration.mdp -o step6_3.tpr -c step6_2.gro -r lca1_glucose_ions.gro -p lca1_glucose_ions.top -n lca1_glucose_ions.ndx
#srun gmx mdrun -v -deffnm step6_3 -gpu_id 0 -pin on -nb gpu -pme gpu -pmefft gpu -bonded gpu -nt 1
#gmx grompp -f /home/stwb3922/sharedscratch/dota_membranes/w_glucose_NaCl/T_298K/step6.4_equilibration.mdp -o step6_4.tpr -c step6_3.gro -r lca1_glucose_ions.gro -p lca1_glucose_ions.top -n lca1_glucose_ions.ndx
#srun gmx mdrun -v -deffnm step6_4 -gpu_id 0 -pin on -nb gpu -pme gpu -pmefft gpu -bonded gpu -nt 1
#gmx grompp -f /home/stwb3922/sharedscratch/dota_membranes/w_glucose_NaCl/T_298K/step6.5_equilibration.mdp -o step6_5.tpr -c step6_4.gro -r lca1_glucose_ions.gro -p lca1_glucose_ions.top -n lca1_glucose_ions.ndx
#srun gmx mdrun -v -deffnm step6_5 -gpu_id 0 -pin on -nb gpu -pme gpu -pmefft gpu -bonded gpu -nt 1
#gmx grompp -f /home/stwb3922/sharedscratch/dota_membranes/w_glucose_NaCl/T_298K/step6.6_equilibration.mdp -o step6_6.tpr -c step6_5.gro -p lca1_glucose_ions.top -n lca1_glucose_ions.ndx
#srun gmx mdrun -v -deffnm step6_6 -gpu_id 0 -pin on -nb gpu -pme gpu -pmefft gpu -bonded gpu -nt 1
srun gmx mdrun -v -deffnm step7_0 -cpi step7_2.cpt -cpo step7_3.cpt -noappend -gpu_id 0 -pin on -nb gpu -pme gpu -pmefft gpu -bonded gpu -nt 1
