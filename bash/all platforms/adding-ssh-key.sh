#!/bin/bash
uname=$(whoami)
now=`date +%Y-%m-%d`
key_path=~/.ssh/keys/ssh-keys-${now};
mkdir -p ${key_path}
mkdir -p ${key_path}/public
for key_type in internal external deployed; do #this loop will generate 3 key pairs (if you need less or more. change it)
	echo "Now creating ${key_type} ssh key (if you plan on automating loading of ssh keys, leave the password empty)"
	ssh-keygen -q -t rsa -b 2048 -C "${uname}-${key_type}-${now}" -f ${key_path}/${uname}-${now}-${key_type};
	mv ${key_path}/${uname}-${now}-${key_type}.pub ${key_path}/public/
done

echo "your new keys are located in:${key_path}"
echo ""
echo "to automate the loading of your SSH keys please add the following line to you profile file"
echo "if you are using Linux system please run the following command:"
echo "printf \"ssh-add ${key_path}/* &>/dev/null \" >> ~/.bashrc && source ~/.bashrc"
echo ""
echo "if you are using Mac OS  system please run the following command:"
echo "printf \"ssh-add ${key_path}/* &>/dev/null \" >> ~/.profile && source ~/.profile"
