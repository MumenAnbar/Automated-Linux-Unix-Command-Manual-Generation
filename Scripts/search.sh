curCommand=$1
if [ -f "$curCommand.txt" ] # if curCommand is generated and has its manual text file
then
  cat $curCommand.txt # print the manual of this command
else
  echo "File does not exist." # this command is not generated or doesn't exist
fi
