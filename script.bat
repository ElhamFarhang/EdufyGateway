@echo off
echo Stopping edufygateway
docker stop edufygateway
echo Deleting container edufygateway
docker rm edufygateway
echo Deleting image edufygateway
docker rmi edufygateway
echo Running mvn package (skips tests)
call mvn package -DskipTests
echo Creating image edufygateway
docker build -t edufygateway .
echo Creating and running container edufygateway
docker run -d -p 9901:9901 --name edufygateway --network edufy_network edufygateway
echo Done!