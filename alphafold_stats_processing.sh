#!/bin/bash -l
#SBATCH --partition=gpu
#SBATCH --time=10:00:00
#SBATCH --gpus=1
#SBATCH --cpus-per-gpu=12
#SBATCH --mem-per-gpu=36G

eval "$(conda shell.bash hook)"
export ALPHAFOLD_DATADIR=/datasets/alphafold/
export ALPHAFOLD_DIR=/scratch/users/your-k-number/directtory_where_you_installed_alphafold-2.3.2/alphafold-2.3.2    #modify

echo INFO: SLURM_GPUS_ON_NODE=$SLURM_GPUS_ON_NODE
echo INFO: SLURM_JOB_GPUS=$SLURM_JOB_GPUS
echo INFO: SLURM_STEP_GPUS=$SLURM_STEP_GPUS
echo INFO: ALPHAFOLD_DIR=$ALPHAFOLD_DIR
echo INFO: ALPHAFOLD_DATADIR=$ALPHAFOLD_DATADIR
echo INFO: TMP=$TMP

output_dir=/scratch/users/alphafold-2.3.2/Output-$SLURM_JOB_ID
mkdir -p $output_dir
echo INFO: output_dir=$output_dir

conda activate alpha
python3 -m pip install -r ${ALPHAFOLD_DIR}/singularity/requirements.txt

python3 ${ALPHAFOLD_DIR}/processing_stats.py \
    --input_dir=specify_your_alphafold_output_dir_with_the_pkl_files \      #modify
    --output_dir=$output_dir \

echo INFO: AlphaFold returned $?
