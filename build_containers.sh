#!/bin/bash

# Construir las imágenes de los servicios definidos en docker-compose.yml
echo "Construyendo las imágenes de los servicios..."
docker-compose build

# Verificar si la construcción fue exitosa
if [ $? -ne 0 ]; then
  echo "La construcción de las imágenes falló. Abortando."
  exit 1
fi

# Levantar los contenedores en segundo plano
echo "Levantando los contenedores..."
docker-compose up -d

# Verificar si los contenedores se levantaron correctamente
if [ $? -ne 0 ]; then
  echo "El levantamiento de los contenedores falló. Abortando."
  exit 1
fi

echo "Los contenedores se levantaron correctamente."