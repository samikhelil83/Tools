#!/bin/bash

echo "####memory on server###"

dmidecode -t memory |grep Size |awk {'print $2'} | paste -sd+ - | bc
