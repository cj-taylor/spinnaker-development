#!/usr/bin/env bash
set -x
docker kill spinnaker-redis
docker kill spinnaker-halyard
docker rm spinnaker-redis
docker rm spinnaker-halyard

PARENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && pwd)" && cd $PARENT_DIR || exit 1

spinnaker_dir=$PARENT_DIR/spinnaker-repos

mkdir -p ~/.hal
mkdir -p $spinnaker_dir

docker run --name spinnaker-redis -d redis redis-server --appendonly yes

# halyard
docker run \
    -p 9000:9000 \
    -p 8084:8084 \
    -p 8083:8083 \
    -p 7002:7002 \
    -p 8080:8080 \
    -p 8087:8087 \
    -p 8088:8088 \
    -p 8089:8089 \
    -p 7003:7003 \
    -p 8064:8064 \
    -p 8090:8090 \
    --name spinnaker-halyard \
    --rm \
    --link spinnaker-redis:redis \
    -v ~/.hal:/root/.hal \
    -v $HOME/.ssh/config_spinnaker:/root/.ssh/config \
    -v $HOME/.ssh/github_com_rsa:/root/.ssh/github_com_rsa \
    -v $HOME/.ssh/github_com_rsa.pub:/root/.ssh/github_com_rsa.pub \
    -v $PARENT_DIR/spinnaker-development/scripts:/root/setup_scripts \
    -v $spinnaker_dir:/root/dev/spinnaker \
    -e GITHUB_USER="$github_com_user" \
    -e GITHUB_USERNAME="$github_com_user_name" \
    -e GITHUB_EMAIL="$github_com_user_email" \
    -d \
    -it \
    gcr.io/spinnaker-marketplace/halyard:stable

sleep 25 # time it seems to take for the container to be available 
docker logs spinnaker-halyard

# install deps
docker exec -it spinnaker-halyard bash /root/setup_scripts/installDependencies.sh
