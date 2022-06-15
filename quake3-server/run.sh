# Read .env
if [ -f .env ]
then
    export $(cat .env | sed 's/#.*//g' | xargs)
else
    echo ".env file not found!"
    exit 0
fi

# Docker
# - stop container
docker stop ${ALIAS}
docker rm ${ALIAS}

# - remove old image (if there is any)
docker rmi $(docker images --filter=reference="*:${ALIAS}-image" -q)

# - build new docker image from Dockerfile
docker build -t ${ALIAS}-image .

# - start new container using docker-compose
docker-compose up -d

# remove unused images - uncomment if you wnat to delete unused images.
docker image prune -a