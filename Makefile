GREEN=\033[0;32m
NC=\033[0m

images:
	printf "${GREEN}Building images${NC}\n"
	docker build --file app/Dockerfile-prod -t notes-app ./app
	docker build -t notes-server ./server

push: images
	printf "${GREEN}Tagging images${NC}\n"
	docker tag notes-app ${HOST}:443/notes-app
	docker tag notes-server ${HOST}:443/notes-server

	printf "${GREEN}Pushing images${NC}\n"
	docker push ${HOST}:443/notes-app
	docker push ${HOST}:443/notes-server

prod: push
	printf "${GREEN}Deploying images to ${HOST}${NC}\n"
	MONGO_DATA_DIR=/var/lib/mongo docker stack deploy -c docker-compose.yml --with-registry-auth easynotes

local: images
	printf "${GREEN}Deploying images locally${NC}\n"
	MONGO_DATA_DIR=/usr/local/var/mongodb docker stack deploy -c docker-compose.yml --with-registry-auth easynotes

down:
	docker stack rm easynotes