#!/bin/bash
declare -A Triplet_Dictionary
read -p "Enter the count for Coin Filp: " number
Triplet_Dictionary[HHH]=0
Triplet_Dictionary[HHT]=0
Triplet_Dictionary[HTH]=0
Triplet_Dictionary[THH]=0
Triplet_Dictionary[HTT]=0
Triplet_Dictionary[THT]=0
Triplet_Dictionary[TTH]=0
Triplet_Dictionary[TTT]=0

counter=0
flips=0
while [ $flips -lt $number ]
do
        RandomCheck=$(( RANDOM%4 ))
        case $RandomCheck in
                0 ) Triplet_Dictionary[HHH]=$(( ${Triplet_Dictionary[HHH]}+1 )) ;;
                1 ) Triplet_Dictionary[HHT]=$(( ${Triplet_Dictionary[HHT]}+1 )) ;;
                2 ) Triplet_Dictionary[HTH]=$(( ${Triplet_Dictionary[HTH]}+1 )) ;;
                3 ) Triplet_Dictionary[THH]=$(( ${Triplet_Dictionary[THH]}+1 )) ;;
                4 ) Triplet_Dictionary[HTT]=$(( ${Triplet_Dictionary[HTT]}+1 )) ;;
                5 ) Triplet_Dictionary[THT]=$(( ${Triplet_Dictionary[THT]}+1 )) ;;
                6 ) Triplet_Dictionary[TTH]=$(( ${Triplet_Dictionary[TTH]}+1 )) ;;
                7 ) Triplet_Dictionary[TTT]=$(( ${Triplet_Dictionary[TTT]}+1 )) ;;
                * ) echo "Invalid RandomCheck"
        esac
        flips=`expr $flips + 1`
done

echo "Occurences of Head and Tails"
for i in "${!Triplet_Dictionary[@]}"
do
      echo  $i : ${Triplet_Dictionary[$i]}
done

echo "Percentage Occurences of Heads and Tails"
for i in "${!Triplet_Dictionary[@]}"
do
        result=$(( $number * 100 ))
        echo $i ":" $( echo ${Triplet_Dictionary[$i]} $result | awk '{print $1 / $2 }' )
done


