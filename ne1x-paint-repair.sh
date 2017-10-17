#!/bin/sh

python36 enhance.py \
    --train "$OPEN_IMAGES_PATH/*.[jt][pi][gf]" --nums $1 --type paint --model repair \
    --epochs=50 --batch-shape=256 --device=gpu0 \
    --generator-downscale=3 --generator-upscale=3 \
    --generator-blocks=8 --generator-filters=128 --generator-residual=0 \
    --perceptual-layer=conv2_2 --smoothness-weight=1e7 --adversary-weight=0.0 \
    --train-noise=2.0 --train-jpeg=30

python36 enhance.py \
    --train "$OPEN_IMAGES_PATH/*.[jt][pi][gf]" --nums $1 --type paint --model repair \
    --epochs=50 --batch-shape=240 --device=gpu0 \
    --generator-downscale=3 --generator-upscale=3 \
    --perceptual-layer=conv5_2 --smoothness-weight=5e3 --adversary-weight=5e1 \
    --generator-start=10 --discriminator-start=0 --adversarial-start=10 \
    --discriminator-size=48 \
    --train-noise=2.0 --train-jpeg=30
