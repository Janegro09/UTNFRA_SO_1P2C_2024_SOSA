#!/bin/bash

LISTA=$1
USER_HASH=$2
HASH=$(sudo grep -i $USER_HASH /etc/shadow | awk -F ':' '{print $2}' )

#echo "Clave:"
#echo "$HASH"

ANT_IFS=$IFS
IFS=$'\n'
for LINEA in `cat $LISTA |  grep -v ^#`
do
	echo "Linea: $LINEA"
	echo
	USUARIO=$(echo  $LINEA |awk -F ',' '{print $1}')
	GRUPO=$(echo  $LINEA |awk -F ',' '{print $2}')
	if [ $(grep $GRUPO -c /etc/group) == 0 ]; then
		sudo groupadd $GRUPO
		#sudo useradd -m -p "$HASH" -s /bin/bash -G $GRUPO $USUARIO
		#echo "------------------------"
		#echo 
	fi
		sudo useradd -m -p "$HASH" -s /bin/bash -G $GRUPO $USUARIO
done
IFS=$ANT_IFS

