#!/bin/sh

python enhance.py \
    --train "$OPEN_IMAGES_PATH/*.[jt][pi][gf]" --nums $1 --type paint --model default \
    --epochs=100 --batch-shape=256 --device=gpu0 \
    --generator-downscale=0 --generator-upscale=4 --generator-filters=64 \
    --generator-blocks=4 --generator-residual=2 \
    --perceptual-layer=conv2_2 \
    --perceptual-weight=2e0 --smoothness-weight=1e7 --adversary-weight=0.0 --pixel-weight=1e0 \
    --train-noise=1.0

python enhance.py \
    --train "$OPEN_IMAGES_PATH/*.[jt][pi][gf]" --nums $1 --type paint --model default \
    --epochs=300 --batch-shape=192 --device=gpu0 \
    --generator-downscale=0 --generator-upscale=4 \
    --perceptual-layer=conv5_2 \
    --perceptual-weight=2e0 --smoothness-weight=5e3 --adversary-weight=5e1 --pixel-weight=1e0 \
    --generator-start=10 --discriminator-start=0 --adversarial-start=10 \
    --discriminator-size=64 \
    --train-noise=1.0
