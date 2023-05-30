## Requirements

| Name                                                                     | Version   |
| ------------------------------------------------------------------------ | --------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | ~> 1.3    |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | ~> 4.47.0 |
| <a name="requirement_cloudinit"></a> [cloudinit](#requirement_cloudinit) | ~> 2.2.0  |
| <a name="requirement_random"></a> [random](#requirement_random)          | ~> 3.4.3  |
| <a name="requirement_tls"></a> [tls](#requirement_tls)                   | ~> 4.0.4  |

## Providers

| Name                                                      | Version |
| --------------------------------------------------------- | ------- |
| <a name="provider_random"></a> [random](#provider_random) | 3.4.3   |

## Modules

| Name                                         | Source        | Version |
| -------------------------------------------- | ------------- | ------- |
| <a name="module_ecr"></a> [ecr](#module_ecr) | ./modules/ecr | n/a     |
| <a name="module_eks"></a> [eks](#module_eks) | ./modules/eks | n/a     |
| <a name="module_vpc"></a> [vpc](#module_vpc) | ./modules/vpc | n/a     |

## Resources

| Name                                                                                                          | Type     |
| ------------------------------------------------------------------------------------------------------------- | -------- |
| [random_string.suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name                                                                  | Description  | Type     | Default       | Required |
| --------------------------------------------------------------------- | ------------ | -------- | ------------- | :------: |
| <a name="input_project_name"></a> [project_name](#input_project_name) | Project name | `string` | `"exercise"`  |    no    |
| <a name="input_region"></a> [region](#input_region)                   | AWS region   | `string` | `"eu-west-2"` |    no    |

## Outputs

| Name                                                                                                           | Description                                              |
| -------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------- |
| <a name="output_cluster_endpoint"></a> [cluster_endpoint](#output_cluster_endpoint)                            | Endpoint for EKS control plane                           |
| <a name="output_cluster_name"></a> [cluster_name](#output_cluster_name)                                        | Kubernetes Cluster Name                                  |
| <a name="output_cluster_security_group_id"></a> [cluster_security_group_id](#output_cluster_security_group_id) | Security group ids attached to the cluster control plane |
| <a name="output_region"></a> [region](#output_region)                                                          | AWS region                                               |
