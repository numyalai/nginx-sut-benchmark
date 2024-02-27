clientInstanceName="client-r10"


echo "Client Instance Name: $clientInstanceName"

#Autostart services https://askubuntu.com/questions/1367139/apt-get-upgrade-auto-restart-services
export DEBIAN_FRONTEND=noninteractive


sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker \$USER


docker --version


sudo apt install -y -q git
git --version


githubRepo="https://github.com/numyalai/nginx-load-generator.git"
echo $PWD

cd ~
git clone $githubRepo
cd nginx-load-generator
git pull
docker build -t $clientInstanceName .


touch /done