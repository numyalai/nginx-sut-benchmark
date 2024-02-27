run=$1
clientInstanceName="client-r"$run
clientContainerName="load-generator-"$run
loadBalancerInstanceName="nginx-load-balancer"


duration=300
concurrency_level=5

file="1kb.bin"
small_file="1mb.bin"
mid_size_file="large_file_500.bin"
large_file="large_file_1000.bin"

SUT_IP=$(gcloud compute instances describe $loadBalancerInstanceName --zone='europe-west3-c' --format='get(networkInterfaces[0].accessConfigs[0].natIP)' --quiet)
echo "SUT IP is " $SUT_IP


# Run the load generator
gcloud compute ssh $clientInstanceName --zone=europe-west3-c --command="sudo docker run -d -v \$(pwd):/output --name $clientContainerName client-r10 $SUT_IP $small_file $concurrency_level $duration"


echo "Load generator started on VM."
sleep ${duration}s 
echo "Completed."