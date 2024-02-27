# Benchmarking Request handling, Throughput and Latency of NGINX under various request loads.

System Under Test (SUT): A Java-based load generator sends HTTP GET Requests to an NGINX server hosting static, bin, jpg files.

## Table of Contents

- [Project Name](#project-name)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Features](#features)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Contributing](#contributing)
  - [License](#license)

## Introduction

# Benchmark Design

## Various Experimental Setups

- Concurrency Levels: 5, 10, 100
- Test Durations: 0.5, 10, 60 minutes

## Load Generator Implementation

The load for the System Under Test (SUT) is generated using Java's `HttpUrlConnection` libraries.

## Measurement Metrics

The following metrics are measured during the benchmark:

- **Latency**: The time taken for a request to be fulfilled by the SUT.
- **Throughput**: The number of requests processed by the SUT per unit of time.


## Features

- Feature 1
- Feature 2
- Feature 3

## Installation

To run this project locally, follow these steps:

1. Clone the repository:

   ```bash
   git clone [https://github.com/numyalai/nginx-sut-benchmark/]
   ```

   cd nginx-sut-benchmar

    There are two ways to run the experiment 1. using terraform 2. by running the scripts manually

2. 
   cd terraform
   terraform init
   terraform plan
   terraform apply --auto-approve
   terraform destroy --auto-approve
     
   chmod +x prepare_sut_benchmark.sh
   ./prepare_sut_benchmark.sh
   wait until the script finishes executing
   cd ../
   chmod +x runBenchmark.sk
   ./runBenchmark.sh
3. chmod +x startClient.sh 1
4. chmod +x startSUT.sh 
5. ./startClient.sh  indicating the suffix for the run client-r1, 
6. ./startSUT.sh 1 -> indicatign the suffic for the sut vm


git clone [https://github.com/numyalai/nginx-sut-benchmark/]
cd nginx-sut-benchmark




Running the Experiment:
There are two ways to run the experiment:

A. Using Terraform:

cd terraform
terraform init
terraform plan
terraform apply --auto-approve
terraform destroy --auto-approve


chmod +x prepare_sut_benchmark.sh
./prepare_sut_benchmark.sh 1
# Wait until the script finishes executing
cd ../
chmod +x runBenchmark.sk
./runBenchmark.sh



B. Manually Running the Scripts:
chmod +x startClient.sh
chmod +x startSUT.sh 
./startClient.sh 1 # indicating the suffix for the run client-r1
./startSUT.sh 1   # indicating the suffix for the sut vm
./runBenchmark.sh
./getResults.sh 1 ~/results



Additional Setup for Load Balancer:
In addition to the above setup, you can run the experiment with Nginx as a Load Balancer to the NGINX web server backends.

1. Provision Instances:
Uncomment the instance creation code in the Terraform script to provision as many instances as needed for the experiment.

chmod +x prepare_sut_benchmark.sh
./prepare_sut_benchmark.sh 1
./prepare_sut_benchmark.sh 2
./prepare_sut_benchmark.sh 3



2. Provision Load Balancer:
chmod +x startLoadBalancer.sh 
./startLoadBalancer.sh


Update the nginx_lb.conf file upstream directive with the external IP addresses of the SUT instances.

chmod +x runLoadBalancerBenchmark.sh
./runLoadBalancerBenchmark.sh


Result Analysis:
Finally, run:

./getResults.sh 1 ~/results


