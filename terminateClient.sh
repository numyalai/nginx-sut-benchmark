run=$1
SUTinstanceName="client-r"$run
gcloud compute instances delete $SUTinstanceName --zone="europe-west3-c" --delete-disks="all" --quiet
