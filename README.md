# Platform Engineering Exercise

[![tfsec](https://github.com/josephgoksu/platform-eng-exercise/actions/workflows/tfsec.yml/badge.svg)](https://github.com/josephgoksu/platform-eng-exercise/actions/workflows/tfsec.yml)

## Overview

This repository contains the code for the Platform Engineering Exercise. The exercise is to create a Kubernetes cluster in AWS using Terraform.

## Table of Contents

- [Platform Engineering Exercise](#platform-engineering-exercise)
  - [Overview](#overview)
  - [Table of Contents](#table-of-contents)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Architecture](#architecture)
    - [Components](#components)
    - [Installing](#installing)
    - [Uninstalling](#uninstalling)

## Getting Started

### Prerequisites

- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- flux2 (optional)

### Architecture

The architecture sequence diagram can be found [here](./docs/Architecture.md).

### Components

- VPC
- EKS Cluster

  - EKS Addon: EBS CSI Driver | The EBS CSI driver addon is added to the Amazon EKS cluster to allow Kubernetes to use Amazon Elastic Block Store (EBS) volumes as persistent volumes in the cluster.

- ECR Repository
- Flux2 with Helm (Optional)
- nginx with Helm (Optional)

The dependencies can be found [here](./docs/Dependencies.md). It has been generated using terraform-docs

### Installing

```bash
terraform init
terraform apply
```

### Uninstalling

```bash
terraform destroy
```

If you get an error related nodegroups, you can delete the nodegroup and cluster manually.

```bash
aws eks list-nodegroups --cluster-name exercise-eks
aws eks delete-nodegroup --cluster-name exercise-eks --nodegroup-name exercise-eks-default-winning-chipmunk
aws eks delete-cluster --name exercise-eks
```
