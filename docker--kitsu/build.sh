set -a # automatically export all variables
source .env
set +a
cd ./build &
docker build \
    --file ./build/Dockerfile \
    --build-arg KITSU_VERSION=$KITSU_VERSION \
    --build-arg ZOU_VERSION=${ZOU_VERSION} \
    --tag kitsu--${KITSU_VERSION}_zou--${ZOU_VERSION} .
