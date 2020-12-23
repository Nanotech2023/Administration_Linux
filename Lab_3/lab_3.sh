#!/bin/bash

#1.
awk -F":" '{ print("user", $1, "has id", $3) }' /etc/passwd > ~/work3.log

#2.
passwd -S root | cut -d" " -f3 >> ~/work3.log

#3.
awk -F":" 'ORS="," {print $1}' /etc/group >> ~/work3.log


#4.
echo "Be careful!" > /etc/skel/readme.txt

#5.
useradd u1 -p $(openssl passwd -crypt 12345678)

#6.
groupadd g1

#7.
usermod -a -G g1 u1

#8.
id u1 >> ~/work3.log

#9.
useradd user -p $(openssl passwd -crypt 12345678)
usermod -a -G g1 user

#10.
awk -F":" '$1 == "g1" {print $1}' /etc/group >> ~/work3.log

#11.
usermod -s /usr/bin/mc user

#12.
useradd u2 -p $(openssl passwd -crypt 87654321)

#13.
mkdir /home/test13
cp ~/work3.log /home/test13/work3-1.log
cp ~/work3.log /home/test13/work3-2.log

#14.
usermod -a -G g1 u2
chown u1:g1 /home/test13 -R
chmod 640 /home/test13 -R
chmod 550 /home/test13 

#15.
mkdir /home/test14
chmod 1777 /home/test14

#16.
cp /bin/nano /home/test14/nano
chmod 6555 /home/test14/nano

#17.
mkdir /home/test15
echo "It's a secret file!" > /home/test15/secret_file
chmod 111 /home/test15
chmod 444 /home/test15/secret_file
