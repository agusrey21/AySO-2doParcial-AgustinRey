#punto B: Ansible
#● Desde el Ansible Management Node con IP 196.168.56.8 actualizar todos los paquetes e 
#instalar apache2 en el host Desarrollo con IP 196.168.56.9 
#● En la siguiente imagen se detalla la información.

#INSTRUCCIONES: 
#levanto 2 VM, 1 AMN y otra vmAnsibleDev

#en AMN genero la clave:
ssh-keygen

#para la clave publica:
cat .ssh/id_rsa.pub

#vmAnsibleDev:
vim /.ssh/autorized.keys

#conecto desde AMN
ssh vagrant@192.168.56.9

#nos situamos en UTN-FRA_SO_Ansible/ejemplo_02
vim inventory
cat inventory:
  [desarrollo]
    192.168.56.9

    vim playbook #(elimino los 3 ultimos modulos)

    ansible-playbook -i inventory playbook.yml
    sudo apt list --installed |grep apache
