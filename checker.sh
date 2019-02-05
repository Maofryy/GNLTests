#!/bin/bash

RED='\033[0;31m'
GRN='\033[0;32m'
NC='\033[0m'

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

	if [ "$3" -eq 1 ];then
		T="avec"
	elif [ "$3" -eq 0 ]
	then
		T="sans"
	fi

	if [[ "$R" != "$S" ]]; then
		echo  "${RED}Main Test $1 $2 $T \\\n : [KO] Difference between ${NC}$R${RED} and ${NC}$S"
		#return 1
	else
		echo "${GRN}Main Test $1 $2 $T \\\n : [OK]${NC}"
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

echo "--------------------------------------------------------------\n"
echo "${RED}!You may Have to check manually for empty files, or files with no newline! (Change the main)\nAs you should see, the main adds a new line at each line so you should see in the output a \$ and none in the input.\nFor the empty files you might check yourself with a ${NC}./main.out empty_file${NC}\n"

for j in 4 8 16
do
	check_one 1 $i 0 1 $1
done

check_one 0 0 0 1 $1
check_one 0 0 0 0 $1

#Check for the return of get_next_line with testerror.out ?

check_ret () {
	if [ "$#" -ne 5 -a "$#" -ne 6 ]; then
		echo "Illegal number of parameters"
		echo "Usage : sh checker.sh [lines] [characters per line] [with (1) or without new line] [expected return 0/1/-1] [number of reads] [verbose]"
		exit
	fi

	S0="$(sh rungen.sh $1 $2 $3 > file)"
	S=$(cat file)
	R0="$(./ret.out file $5  | cat > ret)"

	R="$(cat ret)"
	if [ "$6" == "-v" ];then
		echo "Input :"
		cat -e file
		echo "\nOutput :"
		cat ret
	fi

	if [ "$3" -eq 1 ];then
		T="avec"
	elif [ "$3" -eq 0 ]
	then
		T="sans"
	fi

	if [[ "$R" != $4 ]]; then
		echo  "${RED}Return test $1 $2 $T \\\n : [KO] Returned ${NC}$R${RED} when expecting ${NC}$4"
	else
		echo "${GRN}Return test $1 $2 $T \\\n : [OK] Returned $R when expecting $4${NC}"
	fi
}
echo "\n--------------------------------------------------------------\n"
check_ret 1 16 1 1 1 $1
check_ret 1 16 0 0 2 $1


#echo "Testing with a illegal file descriptor : (should return -1)"
R=$(./error.out)
if [ "$R" != -1 ];then
	echo  "${RED}Return test : [KO] Returned ${NC}$R${RED} when expecting ${NC}-1"
else
	echo "${GRN}Return test : [OK] Returned $R when expecting -1${NC}"
fi
rm -f file ret
