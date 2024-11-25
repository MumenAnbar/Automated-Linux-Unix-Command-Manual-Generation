# This command will choose and return the related command to the current one
curCommand="$1" # current command in the script
touch ToRun.txt
 > ToRun.txt
if [ "$curCommand" == "ls" ]
then
	(compgen -c | grep $curCommand)  >> ToRun.txt # choosing Related Commands from all commands to the current one

elif [ "$curCommand" == "who" ]
then
	(compgen -c | grep $curCommand)  >> ToRun.txt

elif [ "$curCommand" == "tr" ]
then
	(compgen -c | grep $curCommand)  >> ToRun.txt

elif [ "$curCommand" == "lspci" ]
then
        (compgen -c | grep 'pci')  >> ToRun.txt

elif [ "$curCommand" == "echo" ]
then
	(compgen -c | grep $curCommand)  >> ToRun.txt

elif [ "$curCommand" == "cut" ]
then
	(compgen -c | grep $curCommand)  >> ToRun.txt

elif [ "$curCommand" == "grep" ]
then
	(compgen -c | grep $curCommand)  >> ToRun.txt

elif [ "$curCommand" == "ps" ]
then
	(compgen -c | grep $curCommand)  >> ToRun.txt

elif [ "$curCommand" == "touch" ]
then
	(compgen -c | grep $curCommand)  >> ToRun.txt

elif [ "$curCommand" == "rm" ]
then
	(compgen -c | grep $curCommand)  >> ToRun.txt

elif [ "$curCommand" == "mkdir" ]
then
	(compgen -c | grep 'dir')  >> ToRun.txt

elif [ "$curCommand" == "mv" ]
then
	(compgen -c | grep $curCommand)  >> ToRun.txt


elif [ "$curCommand" == "test" ]
then
	(compgen -c | grep $curCommand)  >> ToRun.txt

elif [ "$curCommand" == "find" ]
then
	(compgen -c | grep $curCommand)  >> ToRun.txt
	
elif [ "$curCommand" == "cp" ]
then
	(compgen -c | grep $curCommand)  >> ToRun.txt
	
elif [ "$curCommand" == "whatis" ]
then
	(compgen -c | grep $curCommand)  >> ToRun.txt
	
elif [ "$curCommand" == "wc" ]
then
	(compgen -c | grep $curCommand)  >> ToRun.txt

elif [ "$curCommand" == "man" ]
then
	(compgen -c | grep $curCommand)  >> ToRun.txt
	
elif [ "$curCommand" == "ln" ]
then
	(compgen -c | grep $curCommand)  >> ToRun.txt

elif [ "$curCommand" == "sort" ]
then
	(compgen -c | grep $curCommand)  >> ToRun.txt
		
fi

(tr '\12' ',' < ToRun.txt) > ./tmp # replacing new line \n with a comma ,
mv tmp ToRun.txt # rename the text file tmp to ToRun.txt
echo "" >> ToRun.txt # adding new line to the file
sed -i -e 's/^/         /' ToRun.txt # adding Tab to 
cat ToRun.txt # returning the answer
