#! /bin/bash


echo "Enter the IP adressess : "
read -a ips
echo "Enter the Usernames : "
read -a usernames

ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa -N ""

public_key="~/.ssh/id_rsa.pb"

for (( i=0; i<${#ips[@]}; i++ )); do
	
	ip=${ips[$i]}
	username=${usernames[$i]}
	
	ssh -q "$username@$ip" "exit"

	if [ $? -eq 0 ]; then
     
        	ssh -q "$username@$ip" "grep -qF '$(cat "$public_key")' ~/.ssh/authorized_keys"

        	if [ $? -ne 0 ]; then
           
        		ssh -q "$username@$ip" "echo '$(cat "$public_key")' >> ~/.ssh/authorized_keys"
			echo "Public key added"
 		else
			echo "Public Key present"

        
        	ssh -q "$username@$ip" "exit"
	else
        	echo "unable to conect"
    	fi
done
