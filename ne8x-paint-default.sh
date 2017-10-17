#!/bin/sh

python36 enhance.py \
    --train "$OPEN_IMAGES_PATH/*.[jt][pi][gf]" --nums $1 --type paint --model default \
    --epochs=100 --batch-shape=256 --device=gpu0 \
    --generator-downscale=1 --generator-upscale=4 --generator-filters=64 \
    --generator-blocks=4 --generator-residual=0 \
    --perceptual-layer=conv2_2 --perceptual-weight=1e2 --smoothness-weight=1e6 --adversary-weight=0.0 \
    --train-noise=1.0

python36 enhance.py \
    --train "$OPEN_IMAGES_PATH/*.[jt][pi][gf]" --nums $1 --type paint --model default \
    --epochs=300 --batch-shape=192 --device=gpu0 \
    --generator-downscale=1 --generator-upscale=4 \
    --perceptual-layer=conv5_2 --smoothness-weight=5e2 --adversary-weight=5e1 \
    --generator-start=10 --discriminator-start=0 --adversarial-start=10 \
    --discriminator-size=64 \
    --train-noise=1.0
