#!/bin/bash
#PBS -N nerf_render
#PBS -q gpu
#PBS -l select=1:ncpus=64:mem=256g:ngpus=1
#PBS -l walltime=0:59:59
#PBS -j oe
#PBS -o nerf_render.log

export ENV_ROOT=/home/DZHANG022/miniconda3/envs/nerf-torch
export PRJ_ROOT=/home/DZHANG022/nerf/nerf-bakery
export LOG_DIR=$PRJ_ROOT/pbs_logs

export PYTHONPATH=$ENV_ROOT/lib/python3.9/site-packages

export MODEL=fern

cd $PRJ_ROOT/

mkdir -p $LOG_DIR

time $ENV_ROOT/bin/python -m nerf --config configs/$MODEL.txt --render_only 2>&1 | tee "$LOG_DIR/render_$MODEL_$(date '+%Y-%m-%d_%H-%M').log"
