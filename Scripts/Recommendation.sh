# This script will take one command then return a recommended command based on the previous one
echo "Suggested Commands:"
history | tail -300 | awk '{print $2}' | sort | uniq -c | sort -nr | head -5 | awk 'NF>1{print $NF}' # get the most frequent command over the previous used 300 commands and print them as suggested to the user;
