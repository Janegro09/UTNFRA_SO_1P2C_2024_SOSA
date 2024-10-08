#!
ARCHIVO='../RTA_ARCHIVOS_Examen_20241006/Filtro_Basico.txt'
grep -i "memtotal" /proc/meminfo > $ARCHIVO
sudo dmidecode -t chassis | awk 'NR==6,NR==7' >> $ARCHIVO  

