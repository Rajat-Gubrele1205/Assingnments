#! /bin/bash


echo "Enter a password : "
read password
length=${#password}
lc=0
up=0
sc=false
if [ $length -eq 0 ]; then
	echo "Please enter the password"
	exit 0 
fi

if [[ $password =~ [^a-zA-Z0-9] ]]; then
   (( sc=true ))
fi

if [ $length -lt 10 ]; then
	if [ "$sc" = true ]; then
		echo "Medium"
		exit 0
	fi
	echo "weak"
        exit 0

fi

for ((i=0;i<$length;i++))
do
	if [[ $password =~ [[:upper:]] ]]; then
		(( up++ ))
	fi

	if [[ $password =~ [[:lower:]] ]]; then
               (( lc++ ))
        fi
done

if [ $lc -eq $length ] || [ $up -eq $length ]; then
	echo "Medium"
	exit 0
else 
	if [ "$sc" = true ]; then 
		echo "Strong"
		exit 0
	fi
	echo "High"
	exit 0
fi

