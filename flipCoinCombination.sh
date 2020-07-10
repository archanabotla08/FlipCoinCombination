#!/bin/bash -x
declare -A Singlet_Dictionary
read -p "Enter the count for Coin Filp: " number
Singlet_Dictionary[H]=0
Singlet_Dictionary[T]=0
counter=0
flips=0
while [ $flips -lt $number ]
do
        RandomCheck=$(( RANDOM%2 ))
        case $RandomCheck in
                0 ) Singlet_Dictionary[H]=$(( ${Singlet_Dictionary[H]}+1 )) ;;
                1 ) Singlet_Dictionary[T]=$(( ${Singlet_Dictionary[T]}+1 )) ;;
                * ) echo "Invalid RandomCheck"
        esac
        flips=`expr $flips + 1`
done

echo "Occurences of Head and Tails"
for i in "${!Singlet_Dictionary[@]}"
do
      echo  $i : ${Singlet_Dictionary[$i]}
done

echo "Percentage Occurences of Heads and Tails"
for i in "${!Singlet_Dictionary[@]}"
do
        result=$(( $number * 100 ))
        echo $i ":" $( echo ${Singlet_Dictionary[$i]} $result | awk '{print $1 / $2 }' )
done


