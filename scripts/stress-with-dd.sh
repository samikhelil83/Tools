#!/bin/bash
while true
do
 dd if=/dev/zero of=test.data bs=1M count=1000 conv=fdatasync;rm -rvf test.data
done
