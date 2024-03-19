# StackGuard
Stack monitoring &amp; Allerting solution for Tendermit nodes

#### Descreption:
Tenderduty serves as an all-encompassing surveillance tool tailored for networks based on Tendermint. Further information is accessible [here](https://github.com/blockpane/tenderduty). The second version of TenderDuty's monitoring system offers the capability to keep track of nodes, notably allowing users to observe the network's height, the status of validators, their uptime, as well as the blocks they've signed and approved. Additionally, it supports the integration of alerts with platforms like Telegram and Discord. While there are multiple methods of installation, my preference leans towards utilizing Docker. Therefore, the setup will require either a dedicated server, which inherently enhances security, or a server that already hosts installed node(s). It's also necessary to either locate open RPCs or establish your own on either the primary node (which is less advised) or a secondary node.

## Installation:
```
#updates
sudo apt update && sudo apt upgrade -y
```
```
#dependenses
sudo apt install curl build-essential git wget jq make gcc tmux htop nvme-cli pkg-config libssl-dev libleveldb-dev tar clang bsdmainutils ncdu unzip libleveldb-dev -y
```
```
#docker
apt update && \
apt install apt-transport-https ca-certificates curl software-properties-common -y && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" && \
apt update && \
apt-cache policy docker-ce && \
sudo apt install docker-ce -y && \
docker --version
```
```
#install tenderduty
tmux new-session -s tenderduty

mkdir tenderduty && cd tenderduty
docker run --rm ghcr.io/blockpane/tenderduty:latest -example-config >config.yml
```

