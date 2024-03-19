#!/bin/bash

# Determine the system's architecture
ARCH=$(uname -m)
DOCKER_REPO=""

case $ARCH in
    x86_64)
        DOCKER_REPO="deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
        ;;
    aarch64)
        DOCKER_REPO="deb [arch=arm64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
        ;;
    *)
        echo "Unsupported architecture: $ARCH"
        exit 1
        ;;
esac

# Check if Docker is already installed
if docker --version &> /dev/null; then
    echo "Docker is already installed."
else
    # Update package lists
    apt update

    # Install packages to allow apt to use a repository over HTTPS
    apt install apt-transport-https ca-certificates curl software-properties-common -y

    # Add Docker's official GPG key
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    # Set up the stable repository based on architecture
    add-apt-repository "$DOCKER_REPO"

    # Update package lists again to include Docker's repo
    apt update

    # Install Docker CE
    apt install docker-ce -y

    # Verify Docker installation
    docker --version
    echo "Docker has been installed."
fi

# Install additional required packages
sudo apt install curl build-essential git wget jq make gcc tmux htop nvme-cli pkg-config libssl-dev libleveldb-dev tar clang bsdmainutils ncdu unzip libleveldb-dev -y

echo "Installation of additional tools and libraries completed successfully."
