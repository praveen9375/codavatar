#! /bin/bash

echo -e "Enter file name: \c"

read file_name

if [ -f $file_name ]
then
     if [ -w $file_name ]
     then
         echo "Type some text data and to quit press ctrl + d"
         cat >> $file_name
     else
         echo "file doesn't have write permissions"
     fi
else
      echo "no file found"
fi
