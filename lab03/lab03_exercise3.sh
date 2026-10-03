  #!/bin/bash

# this is a comment

# for loop to count to 10
for c in {1..5}; do
	echo "Count: $c"

	# if does not use == it uses -eq
	# note the spaces around if [ ]
	if [ $c -eq 3 ]; then
		echo "found the third item"
	fi
done

# how do we pass parameters from the command line
# into this bash script. 
# we use the notation $1, $2 etc to represent
# the first, second etc parameter into this script
if [ -z $1 ]; then
	echo "You didn't pass any paraemters to $0"
else
	echo "You passed in $1 to $0"
fi

# heres a brand new command: 
# it calls ps -ef, then pipes it into word counter
# then stores the result in ct
ct=$(ps -ef | wc -l)
echo "There are $ct processes running on this machine"

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <number> <screen|file>"
    exit 1
fi

logfile="lab03.log"

# Writes a message to screen or log file depending on $2
output() {
    if [ "$2" = "file" ]; then   
     echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$logfile"
     echo "$timestamp - Maximum number of processes exceeded" >> "$logfile"
     echo "$timestamp - Maximum number of processes NOT  exceeded" >> "$logfile"
    else
        echo "$1"
    fi
}

ct=$(ps -ef | wc -l)
output "There are $ct processes running" "$2"

if [ "$ct" -gt "$1" ]; then
    output "Maximum number of processes exceeded" "$2"
else
    output "The maximum number of processes NOT exceeded" "$2"
fi

