#!/bin/sh

AURDIR=$HOME/.cache/aureate

for DIR in $(ls $AURDIR/$DIR)
do
    echo "$DIR"
    cd $AURDIR/$DIR
    git pull && makepkg -si
done
