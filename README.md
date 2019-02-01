# Procedure de test 
cp main.o ./testfiles/main.o
cp testerror.o ./testfiles/.
cd testfiles

# Exemple
cat file1x8n

cat file1x8n | ./main.o

./main.o file1x8n

