# Platform Engineering Exercise

## Overview

This repository contains the code for the Platform Engineering Exercise. The exercise is to create a Kubernetes cluster in AWS using Terraform.

## Getting Started

### Prerequisites

- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- flux2 (optional)

### Components

- VPC
- EKS Cluster

  - EKS Addon: EBS CSI Driver | The EBS CSI driver addon is added to the Amazon EKS cluster to allow Kubernetes to use Amazon Elastic Block Store (EBS) volumes as persistent volumes in the cluster.

- ECR Repository
- Flux2 with Helm (Optional)
- nginx with Helm (Optional)

[Dependencies](./docs/Dependencies.md)

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
