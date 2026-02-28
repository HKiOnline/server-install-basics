#!/usr/bin/env bash

# This script adds Docker's official apt repository and install Docker tools from it.
# The official repository has more up-to-date version of docker than the official Debian repositories.
# See: https://docs.docker.com/engine/install/debian/ 

# Step 1: Add Docker's official GPG key:
sudo apt update
# sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Step 2: Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

# Step 3: Update the package repository
sudo apt update

# Step 4: Unstall the latest version of Docker and its tools
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Step 5: Add my user to the docker group so that sudo is not needed to run commands
# See: https://docs.docker.com/engine/install/linux-postinstall
sudo usermod -aG docker $USER
