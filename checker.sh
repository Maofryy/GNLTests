#!/bin/bash

check_one () {
	if [ "$#" -ne 4 -a "$#" -ne 5 ]; then
		echo "Illegal number of parameters"
		echo "Usage : sh checker.sh [lines] [characters per line] [with (1) or without new line] [from file(1) or stdin(0)] [verbose]"
		exit
	fi

	S0="$(sh rungen.sh $1 $2 $3 > file)"
	S=$(cat file)
	if [ "$4" -eq 1 ]; then
		R0="$(./main.out file > ret)"
	elif [ "$4" -eq 0 ]
	then
		R0="$(cat file | ./main.out | cat > ret)"
	fi

	R="$(cat ret)"

	if [ "$5" == "-v" ];then
		echo "Input :"
		cat -e file
		echo "\nOutput :"
		cat -e ret
	fi

	RED='\033[0;31m'
	GRN='\033[0;32m'
	NC='\033[0m'


	if [ "$3" -eq 1 ];then
		T="avec"
	elif [ "$3" -eq 0 ]
	then
		T="sans"
	fi

	if [[ "$R" != "$S" ]]; then
		echo  "${RED}Test $1 $2 $T \\\n : [KO] Difference between ${NC}$R${RED} and ${NC}$S"
		#return 1
	else
		echo "${GRN}Test $1 $2 $T \\\n : [OK]${NC}"
		#return 0
	fi
}
ran=
lines=(1 2 $(( ( RANDOM % 20 )  + 1 )))
chars=(8 16 4)
stdfile=(0 1)


for i in ${chars[*]}
do
	for j in ${stdfile[*]}
	do
		for k in ${lines[*]}
		do
			check_one $k $i 1 $j $1
		done
		echo "\n"
	done
done

echo "${RED}!You may Have to check manually for empty files, or files with no newline! (Change the main)${NC}\n"

for j in 4 8 16
do
	check_one 1 $i 0 1 $1
done

check_one 0 0 0 0 $1
check_one 0 0 0 1 $1

rm -f file ret
