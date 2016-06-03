#!/bin/bash

SAMPLES=samples.vec
NEGATIVES=negatives.txt
STAGES=20
N_POSITIVES=1200
N_NEGATIVES=600
IMG_SIZE=32
BUF_SIZE=1024


opencv_traincascade -data classifier -vec $SAMPLES -bg $NEGATIVES  -numStages $STAGES -minHitRate 0.999 -maxFalseAlarmRate 0.5 -numPos $N_POSITIVES  -numNeg $N_NEGATIVES -w $IMG_SIZE -h $IMG_SIZE -mode ALL -precalcValBufSize $BUF_SIZE  -precalcIdxBufSize $BUF_SIZE
