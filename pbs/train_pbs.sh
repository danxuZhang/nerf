#!/bin/bash
#PBS -N nerf_train
#PBS -q gpu
#PBS -l select=1:ncpus=64:mem=256g:ngpus=1
#PBS -l walltime=1:59:59
#PBS -j oe
#PBS -o nerf_train.log

export ENV_ROOT=/home/DZHANG022/miniconda3/envs/nerf-torch
export PRJ_ROOT=/home/DZHANG022/nerf/nerf-bakery
export LOG_DIR=$PRJ_ROOT/pbs_logs

export MODEL=fern

cd $PRJ_ROOT/

mkdir -p $LOG_DIR

export PYTHONPATH=$ENV_ROOT/lib/python3.9/site-packages

time $ENV_ROOT/bin/python -m nerf --config configs/$MODEL.txt 2>&1 | tee "$LOG_DIR/train_$MODEL_$(date '+%Y-%m-%d_%H-%M').log"
