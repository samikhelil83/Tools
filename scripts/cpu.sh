#!/bin/bash

echo "###CPU number and type###"

lscpu |grep   'CPU\|Model name\|processeur'
