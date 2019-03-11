#!/usr/bin/env bash

if [ $# -lt 3 ]
  then
    echo "insufficient arguments. model=$1, case=$2, gpu=$3"
    exit 0
fi

model=$1
case=$2
gpu=$3

echo "model=$model"
echo "case=$case"
echo "gpu=$gpu"

if [ ! -d "out" ]
  then
    mkdir out
fi

CUDA_VISIBLE_DEVICES=$gpu nohup python train.py --model $model >> out/$model-$case.out &
tail -f out/$model-$case.out