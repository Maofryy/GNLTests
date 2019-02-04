#!/bin/bash

if [ "$#" -ne 3 ]; then
	echo "Illegal number of parameters"
	echo "Usage : sh checker.sh [lines] [characters per line] [with (1) or without (0) new line]"
	exit
fi

S="$(sh rungen.sh $1 $2 $3)"
R="$(echo -n "$S" | ./main.out)"

echo "\nInput :\n"
echo -n "$S" | cat -e
echo "\nOutput :\n"
echo -n "$R" | cat -e

RED='\033[0;31m'
GRN='\033[0;32m'
NC='\033[0m'

if [ $3 == 1 ]; then
	T="avec"
else
	T="sans"
fi

if [[ "$R" != "$S" ]]; then
	echo "${RED}Test $1 $2 $T \\\n : [KO] Difference between $R and $S${NC}"
else
	echo "${GRN}Test $1 $2 $T \\\n : [OK]${NC}"
fi
