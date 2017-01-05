#!/bin/bash
mkdir -p /Users/myusers
chmod a-rwx,g+rwx /Users/myusers
groupadd -f myusers
chgrp myusers /Users/myusers
useradd -g myusers -M user00
gpasswd -A user00 myusers
for i in $(seq 1 20)
do
	num=$i
	if [ $i -lt 10 ]
	then
		num="0"$i
	fi
	useradd -g myusers -m -d /Users/user$num user$num
	chage -M 30 -m 15 -W 7 -I 7 user$num
done
