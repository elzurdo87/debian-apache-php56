# debian-apache-php56
ultima version de debian con ssh docker

# debian con proxy 

## en Docker file 
descargar el dockerfile y configurar usuario, pass, servidor y puerto

## para construir con docker run
para construir con docker run
utlizar 
docker run -d -p 1180:80 elzurdo87/debian-apache-php56

docker exec -ti <container_name> /bin/bash
