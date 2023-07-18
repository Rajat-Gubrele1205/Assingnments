#! /bin/bash

echo "Enter command for child process : "
read command
child_process(){
	$command
	pid=$!
}
monitor(){
while true; do

if ! ps -p $pid 2> /dev/null; then

	child_process


fi
sleep 1
done 
}
if [ $# -eq 0 ]; then 
	monitor
	
fi
