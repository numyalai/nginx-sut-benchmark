run=$1
resultPath=$2
mkdir $resultPath
SUTinstanceName="nginx-sut-r"$run
clientInstanceName="client-r"$run


gcloud compute scp $clientInstanceName:~/load_generator_results.csv $resultPath/load_generator_results.csv --zone europe-west3-c 
