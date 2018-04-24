#!/usr/bin/env bash
set -x
docker kill spinnaker-halyard

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" && cd $SCRIPT_DIR || exit 1

github_com_user=cj-taylor
spinnaker_dir=$SCRIPT_DIR/repos

mkdir -p ~/.hal
mkdir -p $spinnaker_dir

# halyard
docker run -p 8084:8084 -p 9000:9000 \
    --name spinnaker-halyard \
    --rm \
    -v ~/.hal:/root/.hal \
    -v $spinnaker_dir:/root/dev/spinnaker \
    -v $HOME/.ssh/config_spinnaker:/root/.ssh/config \
    -v $HOME/.ssh/github_com_rsa:/root/.ssh/github_com_rsa \
    -v $HOME/.ssh/github_com_rsa.pub:/root/.ssh/github_com_rsa.pub \
    -d \
    -it \
    gcr.io/spinnaker-marketplace/halyard:stable

sleep 25
docker logs spinnaker-halyard
docker exec -it spinnaker-halyard bash hal config deploy edit --type localgit --git-origin-user=$github_com_user
docker exec -it spinnaker-halyard bash hal deploy apply
