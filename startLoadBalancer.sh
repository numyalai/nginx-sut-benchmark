run=$1
loadBalancerInstanceName="nginx-load-balancer"

echo "Creating a new load balancer instance with name: $loadBalancerInstanceName"
gcloud compute instances create $loadBalancerInstanceName --source-instance-template="demobench" --zone="europe-west3-c"
sleep 40s


#Autostart services https://askubuntu.com/questions/1367139/apt-get-upgrade-auto-restart-services
cmd="export DEBIAN_FRONTEND=noninteractive"
echo $cmd
gcloud compute ssh $loadBalancerInstanceName --zone europe-west3-c -- $cmd
gcloud compute ssh $loadBalancerInstanceName --zone=europe-west3-c --command="sudo apt update && sudo apt upgrade -y"
gcloud compute ssh $loadBalancerInstanceName --zone europe-west3-c -- 'sudo apt install -y -q nginx'


gcloud compute scp nginx_lb.conf $loadBalancerInstanceName:/tmp/nginx.conf --zone europe-west3-c
gcloud compute ssh $loadBalancerInstanceName --zone europe-west3-c -- 'sudo mv /tmp/nginx.conf /etc/nginx/nginx.conf'
gcloud compute ssh $loadBalancerInstanceName --zone europe-west3-c -- 'sudo systemctl restart nginx'
gcloud compute ssh $loadBalancerInstanceName --zone europe-west3-c -- 'sudo systemctl status nginx'
gcloud compute ssh $loadBalancerInstanceName --zone europe-west3-c -- 'sudo cat /etc/nginx/nginx.conf'

