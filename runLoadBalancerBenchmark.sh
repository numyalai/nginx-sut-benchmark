run=$1
clientInstanceName="client-r"$run
loadBalancerInstanceName="nginx-load-balancer"


initialConcurrencyLevel=1
maxConcurrencyLevel=10
rampUpIntervalSeconds=2
experimentDuration=300
benchmarkName="nginx-benchmark-scenario-2"

file="1kb.bin"
small_file="1mb.bin"
mid_size_file="large_file_10.bin"
large_file="large_file_50.bin"
ver_large_file="large_file_100.bin"

SUT_IP=$(gcloud compute instances describe $loadBalancerInstanceName --zone='europe-west3-c' --format='get(networkInterfaces[0].accessConfigs[0].natIP)' --quiet)
echo "SUT IP is " $SUT_IP


# Run the load generator
gcloud compute ssh $clientInstanceName --zone=europe-west3-c --command="sudo docker run -d -v \$(pwd):/output $clientInstanceName $SUT_IP $large_file $initialConcurrencyLevel $maxConcurrencyLevel $rampUpIntervalSeconds $experimentDuration $benchmarkName"


echo "Load generator started on VM."
sleep ${experimentDuration}s 
echo "Completed."