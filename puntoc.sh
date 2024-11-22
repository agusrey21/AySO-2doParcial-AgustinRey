#Punto C: Docker 
#● Crear una imagen de Docker utilizando el servidor web nginx, la imagen debe llamarse 
#2parcial-ayso y tener la etiqueta v1.0 
#● Crear el directorio /appHomeBanking y dentro dos archivos llamados index.html y 
#contacto.html con algún código html de ejemplo 
#● Luego copiar el contenido de este directorio /appHomeBanking a la ruta 
#/usr/share/nginx/html del contenedor nginx 
#● Subir la imagen a Docker Hub utilizando su nombre de usuario, por ejemplo: 
#jperez/2parcial-ayso:v1.0 
#● Colocar en puntoc.sh el nombre de su usuario/imagen:etiqueta para buscar y 
#probar la imagen de Docker hub 
#● Desplegar la imagen Docker recién subida en una VM local, debe mapear el puerto del 
#host de 8080 al puerto 80 del contenedor 
#● Probar que esté funcionando el server web nginx desde un navegador web, ingresar a la 
#página index.html y contacto.html

#INSTRUCCIONES:

mkdir appHomeBanking
cd appHomeBanking/
touch index.html contacto.html
cd ..
touch dockerfile
echo "FROM nginx" > dockerfile
echo "COPY appHomeBanking /usr/share/nginx/html " >> dockerfile
docker login -u reyagus
docker build -t reyagus/2parcial-ayso:v1.0 .
docker image list
docker push reyagus/2parcial-ayso:v1.0
docker run -d -p 8080:80 reyagus/2parcial-ayso:v1.0
docker container ls
