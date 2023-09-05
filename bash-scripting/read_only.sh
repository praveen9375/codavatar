#!/bin/bash

var=31

readonly var

var = 50 

echo "var => $var"

hello()
{
   echo "Hello, madafaka"
}

readonly -f hello

hello()
{
   echo "alladin madafaka"
}
