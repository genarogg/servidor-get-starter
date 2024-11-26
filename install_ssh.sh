#!/bin/bash

# Instalar el servidor SSH
echo "Instalando el servidor SSH..."
sudo apt-get update
sudo apt-get install -y openssh-server

# Verificar si la instalación fue exitosa
if [ $? -ne 0 ]; then
  echo "La instalación del servidor SSH falló. Abortando."
  exit 1
fi

# Crear el usuario 'odin' con la contraseña 'xx'
echo "Creando el usuario 'odin'..."
sudo useradd -m -s /bin/bash odin
echo "odin:xx" | sudo chpasswd

# Verificar si la creación del usuario fue exitosa
if [ $? -ne 0 ]; then
  echo "La creación del usuario 'odin' falló. Abortando."
  exit 1
fi

# Configurar SSH para permitir autenticación por contraseña y acceso root
echo "Configurando SSH..."
sudo sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Habilitar y arrancar el servicio SSH
sudo systemctl enable ssh
sudo systemctl start ssh

# Verificar el estado del servicio SSH
sudo systemctl status ssh

# Configurar el firewall para permitir conexiones SSH
sudo ufw allow 22
sudo ufw enable

# Obtener la IP pública
IP_PUBLICA=$(curl -s ifconfig.me)

# Verificar si la obtención de la IP pública fue exitosa
if [ $? -ne 0 ]; then
  echo "No se pudo obtener la IP pública. Abortando."
  exit 1
fi

# Mostrar mensaje de conexión
echo "El servidor SSH se ha instalado correctamente."
echo "Puedes conectarte al servidor usando el siguiente comando:"
echo "ssh odin@$IP_PUBLICA"