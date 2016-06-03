#!/bin/bash

ORIGINAL_POS_DIR=original
SAMPLES=1500
IMG_SIZE=32
OPENCV_SOURCE_PATh=./opencv-2.4.10/apps/haartraining

./bin/resize.py $ORIGINAL_POSS_DIR $IMG_SIZE

find ./positive_images -iname "*.jpg" > positives.txt
find ./negative_images -iname "*.jpg" > negatives.txt

./bin/createsamples.pl positives.txt negatives.txt samples $SAMPLES  "opencv_createsamples -bgcolor 0 -bgthresh 0 -maxxangle 1.1 -maxyangle 1.1 maxzangle 0.5 -maxidev 40 -w $IMG_SIZE -h $IMG_SIZE"

find ./samples -name '*.vec' > samples.txt

# make sure to put bin/mergevec.cpp into $OPENCV_SOURCE_PATh and compile it before
$OPENCV_SOURCE_PATh/mergevec samples.txt samples.vec
