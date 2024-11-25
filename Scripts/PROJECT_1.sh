numOfCommands=$(cat cfile | wc -l) #Get the number of commands
numOfCommands=$((numOfCommands + 1)) # add them by 1
spc="__________________"
ncommand="######################################################################################################################"
i=1
while [ "$i" -ne "$numOfCommands" ] # A loop to itrate over all the commands
do
	curCommand=$(head -$i cfile | tail -1) #get the i-th line of cfile "Commands File"
	touch $curCommand.txt # create a new text file to put the manual inside it
	> $curCommand.txt # ensure that the file is empty
	echo $ncommand >> $curCommand.txt # add a header style
	echo "" >> $curCommand.txt
	echo -e "${BOLD}>$curCommand${CLEAR}" >> $curCommand.txt
	echo $spc >> $curCommand.txt
	echo "" >> $curCommand.txt
	# add the description of the current command from the manual of the current running device and add it to the manual text file
	man $curCommand | awk '/^DESCRIPTION$/,/^OPTIONS$/' | grep -v '^OPTIONS$' | head -$(((man $curCommand | awk '/^DESCRIPTION$/,/^OPTIONS$/' | grep -v '^OPTIONS$') | grep -n "^$" | cut -b 1) | head -1) >> $curCommand.txt
	echo $spc >> $curCommand.txt
	echo "" >> $curCommand.txt
	# add the version of the current command on the current running device and add it to the manual text file
	echo "Version History:    $("$curCommand" --version | head -1)" >> $curCommand.txt
	echo $spc >> $curCommand.txt
        echo "" >> $curCommand.txt
        # add an example of the current command "If it's possible to generate one" and add it to the manual text file
	echo -e "${BOLD}Example: \n${CLEAR}$(./Examples.sh $curCommand)\n" >> $curCommand.txt
	echo $spc >> $curCommand.txt
        echo "" >> $curCommand.txt
	# add the related of the current command and add it to the manual text file
	echo "${BOLD}Related Commands:${CLEAR} $(./Related.sh $curCommand)" >> $curCommand.txt
        echo $spc >> $curCommand.txt
	echo "" >> $curCommand.txt
	i=$((i + 1))
done

if [ "$1" == "generate" ]
then
	if [ -f "$curCommand.txt" ]
	then
	  cat "$2".txt #print the content of the manual text file of the current Command
	else
	  echo "Command Is Not Supported Or The input is Invalid"
	fi
	
elif [ "$1" == "verify" ]
then 
	./verify.sh $2 #print the verification of the manual text file of the current Command
	
elif [ "$1" == "search" ]
then 
	if [ -f "$curCommand.txt" ]
	then
		./search.sh $2	#search about the  current command
	else
	  echo "Command Is Not Supported Or The input is Invalid"
	fi

	
elif [ "$1" == "suggest" ]
then 
	./Recommendation.sh $2	#get suggested commands

else
	#if the user enterd wrong input
	echo "Please Choose one of the following commands:"
	echo "1-generate to generate the manual of the specified command"
	echo "2-verify to verify the manual of the specified command"
	echo "3-search to search for a command based on a general topic"
	echo "4-suggest to suggest a command to the user"
fi

exit 0
