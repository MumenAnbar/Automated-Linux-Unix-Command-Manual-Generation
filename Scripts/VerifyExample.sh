curCommand=$1
if [ "$curCommand" == "ls" ]
then
	lines=$(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | wc -l) #To Get the specific lines of the curCommand manual which is example part
	(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | tail -$((lines - 1)) | head -$((lines - 2))) > ./tmp
	sed -i.bak $'s/\t//g' tmp # removing the tab from the front of each line in the example part so the comparison occurs accuratly
	ls -l | awk 'NF>1{print $NF}' > ./tmp1 #To get The last word of the line
	sed '1d' ./tmp1 > ./tmp2 # delete the first line which is the command name
	if [ "$(cat tmp)" != "$(cat tmp2)" ] # comparing
	then
		echo "Differ In Example"
	else
		echo "Same Example"
	fi
fi

if [ "$curCommand" == "who" ]
then
	lines=$(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | wc -l)
	(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | tail -$((lines - 1)) | head -$((lines - 2))) > ./tmp
	sed -i.bak $'s/\t//g' tmp
	if [ "$(cat tmp)" != "$(who)" ]
	then
		echo "Differ In Example"
	else
		echo "Same Example"
	fi
fi

if [ "$curCommand" == "tr" ]
then
	lines=$(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | wc -l)
	(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | tail -$((lines - 1)) | head -$((lines - 2))) > ./tmp
	sed -i.bak $'s/\t//g' tmp
	if [ "$(cat tmp)" != "$(echo This is an Example on tr command: | tr 'e' 'X')" ]
	then

		echo "Differ In Example"
	else
		echo "Same Example"
	fi
fi

if [ "$curCommand" == "lspci" ]
then
	lines=$(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | wc -l)
	(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | tail -$((lines - 1)) | head -$((lines - 2))) > ./tmp
	sed -i.bak $'s/\t//g' tmp
	if [ "$(cat tmp)" != "$(lspci -t)" ]
	then
		echo "Differ In Example"
	else
		echo "Same Example"
	fi
fi

if [ "$curCommand" == "echo" ]
then
	lines=$(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | wc -l)
	(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | tail -$((lines - 1)) | head -$((lines - 2))) > ./tmp
	sed -i.bak $'s/\t//g' tmp
	if [ "$(cat tmp)" != "$($curCommand This is an example on echo command)" ]
	then
		echo "Differ In Example"
	else
		echo "Same Example"
	fi
fi


if [ "$curCommand" == "cut" ]
then
	lines=$(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | wc -l)
	(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | tail -$((lines - 1)) | head -$((lines - 2))) > ./tmp
	sed -i.bak $'s/\t//g' tmp
	if [ "$(cat tmp)" != "$(echo This is an Example on cut command | ($curCommand -d ' ' -f1))" ]
	then
		echo "Differ In Example"
	else
		echo "Same Example"
	fi
fi

if [ "$curCommand" == "grep" ]
then
	lines=$(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | wc -l)
	(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | tail -$((lines - 1)) | head -$((lines - 2))) > ./tmp
	sed -i.bak $'s/\t//g' tmp
	if [ "$(cat tmp)" != "$(compgen -c | grep $curCommand)" ]
	then
		echo "Differ In Example"
	else
		echo "Same Example"
	fi
fi

if [ "$curCommand" == "ps" ]
then
	lines=$(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | wc -l)
	(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | tail -$((lines - 1)) | head -$((lines - 2))) > ./tmp
	sed -i.bak $'s/\t//g' tmp
	if [ "$(cat tmp)" != "$(ps)" ]
	then
		echo "Differ In Example"
	else
		echo "Same Example"
	fi
fi

if [ "$curCommand" == "test" ]
then
	lines=$(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | wc -l)
	(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | tail -$((lines - 1)) | head -$((lines - 2))) > ./tmp
	sed -i.bak $'s/\t//g' tmp
	if [ "$(cat tmp)" != "$(echo -e "$($curCommand 'Ali' = 'ali') $?\n")" ]
	then
		echo "Differ In Example"
	else
		echo "Same Example"
	fi
fi

if [ "$curCommand" == "find" ]
then
	lines=$(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | wc -l)
	(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | tail -$((lines - 1)) | head -$((lines - 2))) > ./tmp
	sed -i.bak $'s/\t//g' tmp
	if [ "$(cat tmp)" != "$(find . -name Examples.sh -print)" ]
	then
		echo "Differ In Example"
	else
		echo "Same Example"
	fi
fi


if [ "$curCommand" == "whatis" ]
then
	lines=$(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | wc -l)
	(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | tail -$((lines - 1)) | head -$((lines - 2))) > ./tmp
	sed -i.bak $'s/\t//g' tmp
	if [ "$(cat tmp)" != "$($curCommand whatis)" ]
	then

		echo "Differ In Example"
	else
		echo "Same Example"
	fi
fi

if [ "$curCommand" == "wc" ]
then
	lines=$(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | wc -l)
	(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | tail -$((lines - 1)) | head -$((lines - 2))) > ./tmp
	sed -i.bak $'s/\t//g' tmp
	if [ "$(cat tmp)" != "$($curCommand Examples.sh)" ]
	then

		echo "Differ In Example"
	else
		echo "Same Example"
	fi
fi

if [ "$curCommand" == "man" ]
then
	lines=$(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | wc -l)
	(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | tail -$((lines - 1)) | head -$((lines - 2))) > ./tmp
	sed -i.bak $'s/\t//' tmp
	if [ "$(cat tmp)" != "$($curCommand man)" ]
	then
		echo "Differ In Example"
	else
		echo "Same Example"
	fi
fi

if [ "$curCommand" == "sort" ]
then
	lines=$(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | wc -l)
	(cat $curCommand.txt | awk '/^Example: $/,/^__________________/' | grep -v '^__________________$' | grep -v '^Example: $' | tail -$((lines - 1)) | head -$((lines - 2))) > ./tmp
	sed -i.bak $'s/\t//' tmp
	if [ "$(cat tmp)" != "$($curCommand Examples.sh)" ]
	then
		cat tmp
		echo "Differ In Example"
	else
		echo "Same Example"
	fi
fi

