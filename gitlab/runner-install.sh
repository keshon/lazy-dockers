#!/bin/sh

# Read .env
ALIAS=$(grep ALIAS .env | cut -d '=' -f2)
GITLAB_HOST=$(grep GITLAB_HOST .env | cut -d '=' -f2)

# Get actual token from https://git.mirball.com/admin/runners
registration_token=eEsGq_o4UFgPniFzaeLL

docker exec -it ${ALIAS}--runner \
  gitlab-runner register \
    --non-interactive \
    --registration-token ${registration_token} \
    --locked=false \
    --description docker-stable \
    --url http://${GITLAB_HOST}/ \
    --executor docker \
    --docker-image docker:stable \
    --docker-volumes "/var/run/docker.sock:/var/run/docker.sock" \
    --docker-network-mode gitlab-network


