#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH --ntasks=128
#SBATCH --mem=7G
#SBATCH --time=2-00:00
#SBATCH --job-name=dopc_323

module load gromacs_kcl/2021.5-gcc-9.4.0-openmpi-4.1.1-python-3.8.12

gmx_mpi grompp -f ../../mdp_files/T_323K/step6.1_equilibration.mdp -o step6_1.tpr -c ../step6_0.gro -r ../step5_input.gro -p ../topol.top -n ../index.ndx
mpirun -n 128 gmx_mpi mdrun -v -deffnm step6_1
gmx_mpi grompp -f ../../mdp_files/T_323K/step6.2_equilibration.mdp -o step6_2.tpr -c step6_1.gro -r ../step5_input.gro -p ../topol.top -n ../index.ndx
mpirun -n 128 gmx_mpi mdrun -v -deffnm step6_2
gmx_mpi grompp -f ../../mdp_files/T_323K/step6.3_equilibration.mdp -o step6_3.tpr -c step6_2.gro -r ../step5_input.gro -p ../topol.top -n ../index.ndx
mpirun -n 128 gmx_mpi mdrun -v -deffnm step6_3
gmx_mpi grompp -f ../../mdp_files/T_323K/step6.4_equilibration.mdp -o step6_4.tpr -c step6_3.gro -r ../step5_input.gro -p ../topol.top -n ../index.ndx
mpirun -n 128 gmx_mpi mdrun -v -deffnm step6_4
gmx_mpi grompp -f ../../mdp_files/T_323K/step6.5_equilibration.mdp -o step6_5.tpr -c step6_4.gro -r ../step5_input.gro -p ../topol.top -n ../index.ndx
mpirun -n 128 gmx_mpi mdrun -v -deffnm step6_5
gmx_mpi grompp -f ../../mdp_files/T_323K/step6.6_equilibration.mdp -o step6_6.tpr -c step6_5.gro -p ../topol.top -n ../index.ndx
mpirun -n 128 gmx_mpi mdrun -v -deffnm step6_6
gmx_mpi grompp -f ../../mdp_files/T_323K/step7_production.mdp -o step7_0.tpr -c step6_6.gro -p ../topol.top -n ../index.ndx
mpirun -n 128 gmx_mpi mdrun -v -deffnm step7_0
