# Benchmarking Request handling, Throughput and Latency of NGINX under various request loads.

System Under Test (SUT): A Java-based load generator sends HTTP GET Requests to an NGINX server hosting static, bin, jpg files.

## Table of Contents

- [Project Name](#project-name)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Contributing](#contributing)
  - [License](#license)

## Introduction

# Benchmark Design

## Various Experimental Setups
- File sizes, 1mb, 10mb, 50mb
- Concurrency Levels: 1-10, 1-50, 1-100, 1-1000
- Test Durations: 5, 10, 30, 60 minutes
- ramp up interval: 2, 10,15 seconds

## Load Generator Implementation

The load for the System Under Test (SUT) is generated using Java's `HttpUrlConnection` libraries.

## Measurement Metrics

The following metrics are measured during the benchmark:

- **Latency**: The time taken for a request to be fulfilled by the SUT.
- **Throughput**: The number of requests processed by the SUT per unit of time.
- **TransferRate**: (Kbytes/sec)
- **Iteration_execution_time**



## Installation

To run this project experiment, follow these steps:

1. Clone the repository:

   ```bash
   git clone [https://github.com/numyalai/nginx-sut-benchmark/]
   cd nginx-sut-benchmak
   ```
Running the Experiment:
There are two ways to run the experiment:

## A. Using Terraform:

```bash
cd terraform
terraform init
terraform plan
terraform apply --auto-approve
terraform destroy --auto-approve
```

```bash
After applyging terraform wait until nginx is being installed 
chmod +x prepare_sut_benchmark.sh
./prepare_sut_benchmark.sh 1
```

### Wait until the script finishes executing

```bash
cd ../
chmod +x runBenchmark.sk
./runBenchmark.sh
```

## B. Manually Running the Scripts:
```bash
chmod +x startClient.sh
chmod +x startSUT.sh 
./startClient.sh 1 # indicating the suffix for the run client-r1
./startSUT.sh 1   # indicating the suffix for the sut vm
./runBenchmark.sh 1
./getResults.sh 1 ~/results
```


### Additional Setup for Load Balancer:
In addition to the above setup, you can run the experiment with Nginx as a Load Balancer to the NGINX web server backends.

1. Provision Instances:
Uncomment the instance creation code in the Terraform script to provision as many instances as needed for the experiment.

```bash
chmod +x prepare_sut_benchmark.sh
./prepare_sut_benchmark.sh 1
./prepare_sut_benchmark.sh 2
./prepare_sut_benchmark.sh 3
```

## 2. Provision Load Balancer:

```bash
chmod +x startLoadBalancer.sh 
./startLoadBalancer.sh
```


Update the nginx_lb.conf file upstream directive with the external IP addresses of the SUT instances, you can get the ip addresses from the gcloud UI or with:
```bash
SUT_IP=$(gcloud compute instances describe $SUTinstanceName --zone='europe-west3-c' --format='get(networkInterfaces[0].accessConfigs[0].natIP)' --quiet)
```


```bash
chmod +x runLoadBalancerBenchmark.sh
./runLoadBalancerBenchmark.sh
```


Result Analysis:
Finally, run:

```bash
./getResults.sh 1 ~/results
```


