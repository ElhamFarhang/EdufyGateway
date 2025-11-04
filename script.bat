@echo off
echo Stopping PodcastMS
docker stop PodcastMS
echo Deleting container PodcastMS
docker rm PodcastMS
echo Deleting image PodcastMS
docker rmi PodcastMS
echo Running mvn package (skips tests)
call mvn package -DskipTests
echo Creating image PodcastMS
docker build -t PodcastMS .
echo Creating and running container PodcastMS
docker run -d -p 9904:9904 --name PodcastMS --network dufy_network PodcastMS
echo Done!