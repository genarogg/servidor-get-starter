#!/bin/bash

# Ejecutar el script para instalar los archivos .deb
echo "Instalando archivos .deb..."
./install_debs.sh

# Verificar si la instalación de los archivos .deb fue exitosa
if [ $? -ne 0 ]; then
  echo "La instalación de los archivos .deb falló. Abortando."
  exit 1
fi

# Ejecutar el script para instalar Docker
echo "Instalando Docker..."
./install_docker.sh

# Verificar si la instalación de Docker fue exitosa
if [ $? -ne 0 ]; then
  echo "La instalación de Docker falló. Abortando."
  exit 1
fi

echo "Todos los scripts se ejecutaron correctamente."