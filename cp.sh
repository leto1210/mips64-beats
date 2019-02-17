#!/bin/bash

#!/bin/bash
echo "..:: Script to copy source files/directories to another target location ::.."
echo "Supply the source file/directory below:"
read srcName
echo "Supply the target directory below:"
read dstName
echo " "
echo "..::  Copying from: Source -> Destination  ::.."

ls -larth "$dstName"
ls -larth "$srcName"
cp -rv -t "$dstName" "$srcName"
