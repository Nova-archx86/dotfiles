#!/bin/sh

# simple shell script that i made soley for 
# the purpose of lazily verifying two checksum/hashes

if [[ $1 == $2 ]] 
then
	echo "Match"
else
	echo "No match!"
fi
