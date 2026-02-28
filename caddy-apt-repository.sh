#!/usr/bin/env bash

# This script adds Caddy's official apt repository and installs Caddy from that repository. 
# It offers more up-to-date version of Caddy than the official Debian repositories would (if they have Caddy available at all).
# See: https://caddyserver.com/docs/install#debian-ubuntu-raspbian

# Step 1: Install stable releases repository

# sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https curl
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
chmod o+r /usr/share/keyrings/caddy-stable-archive-keyring.gpg
chmod o+r /etc/apt/sources.list.d/caddy-stable.list

# Step 2: Update the package repository
sudo apt update

# Step 3: Install Caddy
sudo apt install caddy
