run=$1
clientInstanceName="client-r"$run

gcloud compute instance-templates list
gcloud compute instances list

echo "Creating a new client instance with name: $clientInstanceName"
gcloud compute instances create $clientInstanceName --source-instance-template="demobench" --zone="europe-west3-c"
# Wait for the instance to be created
sleep 40s

#Autostart services https://askubuntu.com/questions/1367139/apt-get-upgrade-auto-restart-services
cmd="export DEBIAN_FRONTEND=noninteractive"
echo $cmd
gcloud compute ssh $clientInstanceName --zone europe-west3-c -- $cmd


gcloud compute ssh $clientInstanceName --zone=europe-west3-c --command="
    sudo apt update &&
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common &&
    curl -fsSL https://get.docker.com -o get-docker.sh &&
    sudo sh get-docker.sh &&
    sudo usermod -aG docker \$USER
"

gcloud compute ssh $clientInstanceName --zone=europe-west3-c --command="docker --version"



gcloud compute ssh $clientInstanceName --zone europe-west3-c -- 'sudo apt-get install -y -q git'
gcloud compute ssh $clientInstanceName --zone europe-west3-c -- 'git --version'

githubRepo="https://github.com/numyalai/nginx-load-generator.git"
echo $PWD

gcloud compute ssh $clientInstanceName --zone europe-west3-c --command="git clone $githubRepo"
gcloud compute ssh $clientInstanceName --zone europe-west3-c --command="cd nginx-load-generator && git pull"
gcloud compute ssh $clientInstanceName --zone europe-west3-c --command="cd nginx-load-generator && docker build -t $clientInstanceName ."





