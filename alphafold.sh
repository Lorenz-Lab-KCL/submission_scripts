#!/bin/bash -l
#SBATCH --partition=gpu
#SBATCH --time=10:00:00
#SBATCH --gpus=1
#SBATCH --cpus-per-gpu=12
#SBATCH --mem-per-gpu=36G

eval "$(conda shell.bash hook)"
export ALPHAFOLD_DATADIR=/datasets/alphafold/       
export ALPHAFOLD_DIR=/scratch/users/your-k-number/directtory_where_you_installed_alphafold-2.3.2/alphafold-2.3.2     #modify

echo INFO: SLURM_GPUS_ON_NODE=$SLURM_GPUS_ON_NODE
echo INFO: SLURM_JOB_GPUS=$SLURM_JOB_GPUS
echo INFO: SLURM_STEP_GPUS=$SLURM_STEP_GPUS
echo INFO: ALPHAFOLD_DIR=$ALPHAFOLD_DIR
echo INFO: ALPHAFOLD_DATADIR=$ALPHAFOLD_DATADIR
echo INFO: TMP=$TMP

output_dir=/scratch/users/your-k-number/directtory_where_you_installed_alphafold-2.3.2/Output-$SLURM_JOB_ID     #modify
mkdir -p $output_dir
echo INFO: output_dir=$output_dir

conda activate alpha
python3 -m pip install -r ${ALPHAFOLD_DIR}/singularity/requirements.txt

python3 ${ALPHAFOLD_DIR}/singularity/run_singularity.py \
    --use_gpu \
    --output_dir=$output_dir \
    --data_dir=${ALPHAFOLD_DATADIR} \
    --fasta_paths=${ALPHAFOLD_DIR}/my_file.fasta \      #where my_file is your fasta file in .fasta format
    --max_template_date=2020-05-14 \
    --model_preset=monomer \     #or multimer if your protein is an oligomer
    --db_preset=reduced_dbs

echo INFO: AlphaFold returned $?
