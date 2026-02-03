# build images (if needed) and start containers in detached mode
compose-up:
	docker-compose up -d --build

# stop and remove containers
compose-down:
	docker-compose down

# stop and remove containers
compose-remove:
	docker rm -f jenkins_server

npm-version:
	docker exec jenkins_server npm -v

# jenkins password 
# docker exec jenkins_server cat /var/jenkins_home/secrets/initialAdminPassword