export DEBIAN_FRONTEND=noninteractive

sudo apt update
sudo apt upgrade -y
sudo apt install -y -q nginx


sudo mkdir -p /etc/nginx/files

