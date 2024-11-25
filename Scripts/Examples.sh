# In This Script, Generated Examples will be included to be used in Main.sh and Verify.sh scripts 
curCommand="$1" # The Target Command to get an example on it
touch ToRun.txt # The text file to be (returned) after the geneation.
echo -n "" > ToRun.txt # empty the text file
if [ "$curCommand" == "ls" ] # Example on ls command
then
	echo ">$curCommand" >> ToRun.txt # adding the Example Form the file to be sent to $curCommand.txt manual
	echo "$($curCommand)" >> ToRun.txt  # adding the Example EXECUTION to the file to be sent to $curCommand.txt manual

elif [ "$curCommand" == "who" ] # Example on who command
then
	echo ">$curCommand" >> ToRun.txt # adding the Example Form the file to be sent to $curCommand.txt manual
	echo "$($curCommand)" >> ToRun.txt # adding the Example EXECUTION to the file to be sent to $curCommand.txt manual

elif [ "$curCommand" == "tr" ] # Example on tr command
then
        echo ">echo This is an Example on tr command: | $curCommand 'e' 'X'" >> ToRun.txt
	echo "This is an Example on tr command:" | tr 'e' 'X' >> ToRun.txt # adding the Example EXECUTION to the file to be sent to $curCommand.txt manual

elif [ "$curCommand" == "lspci" ] # Example lspci ls command
then
        echo ">$curCommand -t" >> ToRun.txt # adding the Example Form the file to be sent to $curCommand.txt manual
        echo "$($curCommand -t)" >> ToRun.txt # adding the Example EXECUTION to the file to be sent to $curCommand.txt manual

elif [ "$curCommand" == "echo" ] # Example on echo command
then
        echo ">$curCommand This is an example on echo command" >> ToRun.txt # adding the Example Form the file to be sent to $curCommand.txt manual
        echo "$($curCommand This is an example on echo command)" >> ToRun.txt # adding the Example EXECUTION to the file to be sent to $curCommand.txt manual


elif [ "$curCommand" == "cut" ] # Example on cut command
then
        echo ">echo This is an Example on cut command | $curCommand -d ' ' -f1 " >> ToRun.txt # adding the Example Form the file to be sent to $curCommand.txt manual
        echo "$(echo This is an Example on cut command | ($curCommand -d ' ' -f1))" >> ToRun.txt # adding the Example EXECUTION to the file to be sent to $curCommand.txt manual

elif [ "$curCommand" == "grep" ] # Example on grep command
then
        echo ">compgen -c | grep '$curCommand' " >> ToRun.txt # adding the Example Form the file to be sent to $curCommand.txt manual
        echo "$(compgen -c | grep $curCommand)" >> ToRun.txt # adding the Example EXECUTION to the file to be sent to $curCommand.txt manual

elif [ "$curCommand" == "ps" ] # Example on ps command
then
        echo ">$curCommand" >> ToRun.txt # adding the Example Form the file to be sent to $curCommand.txt manual
        echo "$($curCommand)" >> ToRun.txt # adding the Example EXECUTION to the file to be sent to $curCommand.txt manual

elif [ "$curCommand" == "touch" ] # Example on touch command
then
        echo ">$curCommand AppOnTouch.txt" >> ToRun.txt # adding the Example Form the file to be sent to $curCommand.txt manual
        echo "A new text File will be created in current directory" >> ToRun.txt

elif [ "$curCommand" == "rm" ] # Example on rm command
then
        echo ">$curCommand AppOn_rm.txt" >> ToRun.txt # adding the Example Form the file to be sent to $curCommand.txt manual
        echo "target text file will be deleted" >> ToRun.txt

elif [ "$curCommand" == "mv" ] # Example on mv command
then
        echo ">$curCommand File1.txt File2.txt" >> ToRun.txt # adding the Example Form the file to be sent to $curCommand.txt manual
        echo "File1.txt will be renamed to File2.txt" >> ToRun.txt

elif [ "$curCommand" == "test" ] # Example on test command
then
        echo ">$curCommand 'Ali' = 'ali'" >> ToRun.txt # adding the Example Form the file to be sent to $curCommand.txt manual
        echo -e "$($curCommand 'Ali' = 'ali') $?\n" >> ToRun.txt # adding the Example EXECUTION to the file to be sent to $curCommand.txt manual

elif [ "$curCommand" == "find" ] # Example on find command
then
        echo ">find . -name Examples.sh -print" >> ToRun.txt # adding the Example Form the file to be sent to $curCommand.txt manual
        echo "$(find . -name Examples.sh -print)" >> ToRun.txt # adding the Example EXECUTION to the file to be sent to $curCommand.txt manual
	
elif [ "$curCommand" == "cp" ] # Example on cp command
then
        echo ">$curCommand File1.txt File2.txt" >> ToRun.txt # adding the Example Form the file to be sent to $curCommand.txt manual
        echo "(Data of File1.txt Will be copied to File2.txt)" > ToRun.txt # adding the Example EXPLAINATION to the file to be sent to $curCommand.txt manual

elif [ "$curCommand" == "which" ] # Example on which command
then
        echo ">$curCommand cpp" >> ToRun.txt # adding the Example Form the file to be sent to $curCommand.txt manual
        echo "$($curCommand cpp)" >> ToRun.txt # adding the Example EXECUTION to the file to be sent to $curCommand.txt manual

elif [ "$curCommand" == "whatis" ] # Example on whatis command
then
        echo ">$curCommand whatis" >> ToRun.txt # adding the Example Form the file to be sent to $curCommand.txt manual
        echo "$($curCommand whatis)" >> ToRun.txt # adding the Example EXECUTION to the file to be sent to $curCommand.txt manual

elif [ "$curCommand" == "wc" ] # Example on wc command
then
        echo ">$curCommand Examples.sh" >> ToRun.txt # adding the Example Form the file to be sent to $curCommand.txt manual
        echo "$($curCommand Examples.sh)" >> ToRun.txt # adding the Example EXECUTION to the file to be sent to $curCommand.txt manual

elif [ "$curCommand" == "man" ] # Example on man command
then
        echo ">$curCommand man" >> ToRun.txt # adding the Example Form the file to be sent to $curCommand.txt manual
        echo "$($curCommand man)" >> ToRun.txt # adding the Example EXECUTION to the file to be sent to $curCommand.txt manual

elif [ "$curCommand" == "ln" ] # Example on ln command
then
        echo ">$curCommand Examples.sh ex.sh" >> ToRun.txt # adding the Example Form the file to be sent to $curCommand.txt manual
        echo "(ex.txt will be as a pointer to Examples.sh)" >> ToRun.txt # adding the Example EXPLAINATION to the file to be sent to $curCommand.txt manual

elif [ "$curCommand" == "sort" ] # Example on sort command
then
        echo ">$curCommand Examples.sh" >> ToRun.txt # adding the Example Form the file to be sent to $curCommand.txt manual
        echo "$($curCommand Examples.sh)" >> ToRun.txt # adding the Example EXECUTION to the file to be sent to $curCommand.txt manual

fi

sed -i -e 's/^/\t/' ToRun.txt # adding a Tab to the start of each line for more beautiful form
cat ToRun.txt # print the final output
