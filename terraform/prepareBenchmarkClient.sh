run=$1
SUTinstanceName="nginx-sut-r"$run


SUT_IP="$(gcloud compute instances describe $SUTinstanceName --zone='europe-west3-c' --format='get(networkInterfaces[0].accessConfigs[0].natIP)')"
echo "SUT IP is $SUT_IP"

Autostart services https://askubuntu.com/questions/1367139/apt-get-upgrade-auto-restart-services
cmd="export DEBIAN_FRONTEND=noninteractive"
echo $cmd


gcloud compute scp ../nginx.conf $SUTinstanceName:/tmp/nginx.conf --zone europe-west3-c
gcloud compute ssh $SUTinstanceName --zone europe-west3-c -- 'sudo mv /tmp/nginx.conf /etc/nginx/nginx.conf'
gcloud compute ssh $SUTinstanceName --zone europe-west3-c -- 'sudo systemctl restart nginx'
gcloud compute ssh $SUTinstanceName --zone europe-west3-c -- 'sudo systemctl status nginx'


gcloud compute scp ../index.html $SUTinstanceName:/tmp/index.html --zone europe-west3-c
gcloud compute ssh $SUTinstanceName --zone europe-west3-c -- 'sudo mv /tmp/index.html /etc/nginx/files/index.html'


# Generate binary files inside the created directory
gcloud compute ssh $SUTinstanceName --zone europe-west3-c -- '
    sudo dd if=/dev/zero of=/etc/nginx/files/1kb.bin bs=1K count=1 &&
    sudo dd if=/dev/zero of=/etc/nginx/files/1mb.bin bs=1M count=1 &&
    sudo dd if=/dev/urandom of=/etc/nginx/files/large_file_500.bin bs=1M count=500 &&
    sudo dd if=/dev/urandom of=/etc/nginx/files/large_file_1000.bin bs=1M count=1000'
