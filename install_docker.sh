#!/bin/bash

# Actualizar la lista de paquetes
sudo apt-get update

# Instalar paquetes necesarios
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Agregar la clave GPG oficial de Docker
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Configurar el repositorio estable de Docker
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Actualizar la lista de paquetes nuevamente
sudo apt-get update

# Instalar Docker Engine, CLI, containerd y docker-compose
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose

# Verificar que Docker se haya instalado correctamente
sudo docker --version

# Verificar que docker-compose se haya instalado correctamente
docker-compose --version

echo "Docker y Docker Compose se han instalado correctamente."