#!/bin/sh

echo "Cloning repositories..."

CODE=$HOME/code

mkdir -p $CODE/iot
git clone https://github.com/Moddable-OpenSource/moddable $CODE/iot/moddable

# Personal
# git clone git@github.com:driesvints/driesvints.com.git $CODE/driesvints.com
