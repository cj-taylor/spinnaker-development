#!/usr/bin/env bash

apt-get update
apt-get install -y netcat # deck seems to be missing

ssh-keyscan -H github.com >> /root/.ssh/known_hosts
git config --global user.name "$GITHUB_USERNAME"
git config --global user.email "$GITHUB_EMAIL"
hal config deploy edit --type localgit --git-origin-user="$GITHUB_USER"

# nodejs
if ! which nvm; then
  curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh -o install_nvm.sh
  chmod +x install_nvm.sh
  ./install_nvm.sh
  source ~/.profile
fi

nvm install 8.9.4
nvm use 8.9.4
node -v

# yarn
npm i -g yarn

# do that deploy thing
hal deploy apply
hal deploy connect
