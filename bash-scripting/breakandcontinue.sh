#!/bin/bash

for (( i=1 ; i<=10 ; i++ ))
do
   if [ $i -eq 3 -o $i -eq 6 ]
   then
       continue
   fi

   if [ $i -gt 8 ]
   then
       break
   fi

   echo "$i"
done

