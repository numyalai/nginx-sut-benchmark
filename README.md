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
