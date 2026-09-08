#!/bin/bash

# What to install and where to find it
PACK_NAME=$1
TS_REPO=$2

# Where all packages are installed
# NOTE: This is the Linux path
PACKS_DIR="/home/${USER}/.local/share/nvim/site/pack"

# Where the specific package must be installed
PACK_DIR="${PACK_NAME}/start/${PACK_NAME}"

cd $PACKS_DIR
mkdir -p $PACK_DIR

git clone --depth 1 $TS_REPO $PACK_DIR
