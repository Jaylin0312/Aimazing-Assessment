#! /bin/bash

# start the express-app
docker compose -f ./express-app/docker-compose.yml up -d --build 

# start the vue-app
cd ./vue-app && yarn run build && yarn run preview && cd ..