#Punto A: LVM
#● Crear las particiones, physical volume (pv), group volumen (gv) y logical volumen (lv) 
#definidos en la siguiente imagen sobre un disco de 10Gb. 
#● Asignar la primera partición como disco Swap

#instrucciones: 

#creo las particiones, 3 primarias, 1 extendida y 2 particiones logicas
sudo fdisk /dev/sdc
free -h

#cambio el sistema de archivo de la primera particion
sudo fdisk /dev/sdc
#destino la particion como swap
sudo mkswap /dev/sdc1
#habilito la memoria swap
sudo swapon /dev/sdc1
#verifico
free -h
swapon -s

#cambio el sistema de archivo de las demas particiones
sudo fdisk /dev/sdc
sudo fdisk -l
#creo el volumen fisico
sudo pvcreate /dev/sdc2 /dev/sdc3 /dev/sdc5 /dev/sdc6
sudo pvs

sudo vgcreate vgAdmin /dev/sdc2 /dev/sdc3
sudo vgs

sudo vgcreate vgDevelopers /dev/sdc5 /dev/sdc6
sudo vgs

#creo 3 volumenes logicos (cambio los tamaños por falta de espacio)
sudo lvcreate -L 1G vgDevelopers -n lvDevelopers
sudo lvcreate -L 250M vgDevelopers -n lvTesters
sudo lvcreate -L .9m vgDevelopers -n lvDevops

sudo lvcreate -L 1G vgAdmin -n lvAdmin
#compruebo:
sudo lvs
#ver info lv:
sudo fdisk -l

#formateo:
sudo mkfs.ext4 /dev/mapper/vgDevelopers-lvDevelopers
sudo mkfs.ext4 /dev/mapper/vgDevelopers-lvTesters
sudo mkfs.ext4 /dev/mapper/vgDevelopers-lvDevops
sudo mkfs.ext4 /dev/mapper/vgAdmin-lvAdmin

#montar los lv
sudo mkdir /mnt/lvDevelopers
sudo mkdir /mnt/lvTesters
sudo mkdir /mnt/lvDevops
sudo mkdir /mnt/lvAdmin
sudo mount /dev/mapper/vgDevelopers-lvDevelopers /mnt/lvDevelopers/
sudo mount /dev/mapper/vgDevelopers-lvTesters /mnt/lvTesters/
sudo mount /dev/mapper/vgDevelopers-lvDevops /mnt/lvDevops/
sudo mount /dev/mapper/vgAdmin-lvAdmin /mnt/lvAdmin/

#verifico montajes:
df -h
lsblk -f

