#!/bin/bash -x
Heads=0
Tails=0
RandomCheck=$(( RANDOM%2 ))
if [ $RandomCheck -eq 1 ]
then
        echo "Heads"
else
        echo "Tails"
fi

