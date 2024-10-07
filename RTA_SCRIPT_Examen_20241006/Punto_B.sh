#!/bin/bash

DISCO=$(sudo fdisk -l | grep "10 GiB" | awk '{print $2}' | awk -F ':' '{print $1}')

sudo fdisk $DISCO<< EOF
n
p


+1G
n
e



n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n


w
EOF

echo
echo "Muestro como quedo:"
sudo fdisk -l $DISCO

echo
echo "Formateo las particiones"
sudo mkfs.ext4 ${DISCO}1
#for i in $(seq 5 13); do mkfs.ext4 ${DISCO}{i}; done
sudo mkfs.ext4 ${DISCO}5
sudo mkfs.ext4 ${DISCO}6
sudo mkfs.ext4 ${DISCO}7
sudo mkfs.ext4 ${DISCO}8
sudo mkfs.ext4 ${DISCO}9
sudo mkfs.ext4 ${DISCO}10
sudo mkfs.ext4 ${DISCO}11
sudo mkfs.ext4 ${DISCO}12
sudo mkfs.ext4 ${DISCO}13

echo
echo "Ahora monto los discos"
sudo mount ${DISCO}1 /home/vboxuser/Examenes-UTN/profesores

sudo mount ${DISCO}5 /home/vboxuser/Examenes-UTN/alumno_1/parcial_1
sudo mount ${DISCO}6 /home/vboxuser/Examenes-UTN/alumno_1/parcial_2
sudo mount ${DISCO}7 /home/vboxuser/Examenes-UTN/alumno_1/parcial_3
sudo mount ${DISCO}8 /home/vboxuser/Examenes-UTN/alumno_2/parcial_1
sudo mount ${DISCO}9 /home/vboxuser/Examenes-UTN/alumno_2/parcial_2
sudo mount ${DISCO}10 /home/vboxuser/Examenes-UTN/alumno_2/parcial_3
sudo mount ${DISCO}11 /home/vboxuser/Examenes-UTN/alumno_3/parcial_1
sudo mount ${DISCO}12 /home/vboxuser/Examenes-UTN/alumno_3/parcial_2
sudo mount ${DISCO}13 /home/vboxuser/Examenes-UTN/alumno_3/parcial_3

echo "Monto en forma permanente"
#<dispositivos> <dir> <tipo> <opciones> <dump> <fsck>
echo
echo "${DISCO}1 /home/vboxuser/Examenes-UTN/profesores ext4 defaults 0 0" | sudo tee -a /etc/fstab

echo "${DISCO}5 /home/vboxuser/Examenes-UTN/alumno_1/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}6 /home/vboxuser/Examenes-UTN/alumno_1/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}7 /home/vboxuser/Examenes-UTN/alumno_1/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}8 /home/vboxuser/Examenes-UTN/alumno_2/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}9 /home/vboxuser/Examenes-UTN/alumno_2/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}10 /home/vboxuser/Examenes-UTN/alumno_2/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}11 /home/vboxuser/Examenes-UTN/alumno_3/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}12 /home/vboxuser/Examenes-UTN/alumno_3/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "${DISCO}13 /home/vboxuser/Examenes-UTN/alumno_3/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab

sudo mount -a

