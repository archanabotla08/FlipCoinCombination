#!/bin/bash
declare -A Doublet_Dictionary
read -p "Enter the count for Coin Filp: " number
Doublet_Dictionary[HH]=0
Doublet_Dictionary[HT]=0
Doublet_Dictionary[TH]=0
Doublet_Dictionary[TT]=0

counter=0
flips=0
while [ $flips -lt $number ]
do
        RandomCheck=$(( RANDOM%4 ))
        case $RandomCheck in
                0 ) Doublet_Dictionary[HH]=$(( ${Doublet_Dictionary[HH]}+1 )) ;;
                1 ) Doublet_Dictionary[HT]=$(( ${Doublet_Dictionary[HT]}+1 )) ;;
                2 ) Doublet_Dictionary[TH]=$(( ${Doublet_Dictionary[TH]}+1 )) ;;
                3 ) Doublet_Dictionary[TT]=$(( ${Doublet_Dictionary[TT]}+1 )) ;;
                * ) echo "Invalid RandomCheck"
        esac
        flips=`expr $flips + 1`
done

echo "Occurences of Head and Tails"
for i in "${!Doublet_Dictionary[@]}"
do
      echo  $i : ${Doublet_Dictionary[$i]}
done

echo "Percentage Occurences of Heads and Tails"
for i in "${!Doublet_Dictionary[@]}"
do
        result=$(( $number * 100 ))
        echo $i ":" $( echo ${Doublet_Dictionary[$i]} $result | awk '{print $1 / $2 }' )
done


