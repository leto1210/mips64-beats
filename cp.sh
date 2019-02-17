#!/bin/bash

#!/bin/bash
echo "..:: Script to copy source files/directories to another target location ::.."
srcName="$1"
dstName="$2"
echo "..:: Destination directory "$2" ::.."
/bin/ls -larth "$dstName"
echo " "
echo " "
echo "..:: Source directory "$1" ::.."
/bin/ls -larth "$srcName"
echo " "
echo " "
echo " "
echo "..::  Copying from: Source -> Destination  ::.."
/bin/cp -rv "$srcName" "$dstName"
