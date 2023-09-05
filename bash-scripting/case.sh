#!/bin/bash

vehicle=$(echo "$1" | tr '[:upper:]' '[:lower:]')

case "$vehicle" in
    "car" )
        echo "Rent of $vehicle is \$80"
        ;;
    "bike" )
        echo "Rent of $vehicle is \$90"
        ;;
    "?" )
        echo "Special vehicle: the wheelchair"
        ;;
    [0-9] )
        echo "Number: nahaal mula"
        ;;
    * )
        echo "Unknown vehicle"
        ;;
esac

