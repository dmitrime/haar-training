#!/usr/bin/env python

import os
import sys
from scipy import ndimage
from scipy.misc import imresize, imsave

IMG_SIZE = 32

def read_resize_image(img, img_size):
    """ Read the image, resize it and return a numpy matrix of new size. """
    try:
        return imresize(ndimage.imread(img), (img_size, img_size))
    except IOError:
        print 'File {} not readable, skipping.'.format(img)

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print 'Usage: {} input_dir [image_size]'
        sys.exit(1)

    indir = sys.argv[1]
    img_size = IMG_SIZE
    if len(sys.argv) == 3:
        img_size = int(sys.argv[2])
    outdir = 'positive_images'

    for i, f in enumerate([x for x in os.listdir(indir) if x.endswith('.jpg')]):
        img = read_resize_image(os.path.join(indir, f), img_size)
        imsave(os.path.join(outdir, str(i+1) + '.jpg'), img)
