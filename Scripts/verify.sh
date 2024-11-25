	curCommand="$1" # read the command and save it in curCommand var
	lines=$(cat $curCommand.txt | awk '/^DESCRIPTION$/,/^__________________/' | wc -l) #number of lines to be fetched from the file
	lines=$((lines-1))
	# if statement compares between description in the original manual in linux and the previously made one.
	if [ "$(cat $curCommand.txt | awk '/^DESCRIPTION$/,/^__________________/' | grep -v '^__________________$' | head -$lines)" == "$(man $curCommand | awk '/^DESCRIPTION$/,/^OPTIONS$/' | grep -v '^OPTIONS$' | head -$(((man $curCommand | awk '/^DESCRIPTION$/,/^OPTIONS$/' | grep -v '^OPTIONS$') | grep -n "^$" | cut -b 1) | head -1))" ] 
	then
		echo "Same Description!"
	else
		echo "Differ in Description!"
	fi
	# comapre between linux version in the manual and version in the current running device
	if [ "$(grep 'Version' $curCommand.txt)" == "Version History:    $($curCommand --version | head -1)" ] 
	then
		echo "Same Version!"
	else
		echo "Differ in Version!"
	fi
	#get the verification of the example if it's true or not
	./VerifyExample.sh $curCommand 

