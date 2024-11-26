#!/bin/bash

# Directorio donde se encuentran los archivos .deb
DEB_DIR="./debs"

# Verificar si el directorio existe
if [ ! -d "$DEB_DIR" ]; then
  echo "El directorio $DEB_DIR no existe."
  exit 1
fi

# Instalar todos los archivos .deb en el directorio
for deb in "$DEB_DIR"/*.deb; do
  if [ -f "$deb" ]; then
    echo "Instalando $deb..."
    sudo dpkg -i "$deb"
    sudo apt-get install -f -y
  else
    echo "No se encontraron archivos .deb en $DEB_DIR."
  fi
done

echo "Instalación completada."