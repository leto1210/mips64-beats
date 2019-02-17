#!/bin/bash

#!/bin/bash
echo "..:: Script to copy source files/directories to another target location ::.."
srcName="$1"
dstName="$2"
echo " "
echo "..::  Copying from: Source -> Destination  ::.."
ls -larth "$dstName"
ls -larth "$srcName"
cp -rv -t "$srcName" "$dstName"
