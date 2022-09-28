[![FINOS - Incubating](https://cdn.jsdelivr.net/gh/finos/contrib-toolbox@master/images/badge-incubating.svg)](https://finosfoundation.atlassian.net/wiki/display/FINOS/Incubating)
![website build](https://github.com/finos/cfi-terraform-template-child-module/workflows/Docusaurus-website-build/badge.svg)

# terraform-aws-eks

This terraform module produces an AWS EKS cluster.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 3.63.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.6.1 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.0.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | 3.0.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.0.0 |
| <a name="requirement_template"></a> [template](#requirement\_template) | 2.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.63.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks"></a> [eks](#module\_eks) | terraform-aws-modules/eks/aws | >=17.0.0, <18.0.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 2.66.0 |

## Resources

| Name | Type |
|------|------|
| [aws_kms_key.eks](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/kms_key) | resource |
| [aws_security_group.all_workers](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/security_group) | resource |
| [aws_security_group.worker_group_one](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/security_group) | resource |
| [aws_security_group.worker_group_two](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/security_group) | resource |
| [aws_vpc_dhcp_options.dns_resolver](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/vpc_dhcp_options) | resource |
| [aws_vpc_dhcp_options_association.dns_resolver](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/resources/vpc_dhcp_options_association) | resource |
| [random_string.suffix](https://registry.terraform.io/providers/hashicorp/random/3.0.0/docs/resources/string) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/data-sources/availability_zones) | data source |
| [aws_eks_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.cluster](https://registry.terraform.io/providers/hashicorp/aws/3.63.0/docs/data-sources/eks_cluster_auth) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name_servers"></a> [domain\_name\_servers](#input\_domain\_name\_servers) | List of name servers to configure in /etc/resolv.conf. | `list(string)` | <pre>[<br>  "AmazonProvidedDNS"<br>]</pre> | no |
| <a name="input_enable_dns_hostnames"></a> [enable\_dns\_hostnames](#input\_enable\_dns\_hostnames) | Needs to be true to have a functional EKS cluster; it enables DNS hostnames in the VPC. | `bool` | `true` | no |
| <a name="input_enable_dns_support"></a> [enable\_dns\_support](#input\_enable\_dns\_support) | Needs be true to have a functional EKS cluster; it enables DNS support in the VPC. | `bool` | `true` | no |
| <a name="input_enable_nat_gateway"></a> [enable\_nat\_gateway](#input\_enable\_nat\_gateway) | Should be true if you want to provision NAT Gateways for each of your private networks. | `bool` | `true` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region. | `string` | `"eu-west-2"` | no |
| <a name="input_single_nat_gateway"></a> [single\_nat\_gateway](#input\_single\_nat\_gateway) | Should be true if you want to provision a single shared NAT Gateway across all of your private networks. | `bool` | `true` | no |
| <a name="input_worker_groups_asg_desired_capacity"></a> [worker\_groups\_asg\_desired\_capacity](#input\_worker\_groups\_asg\_desired\_capacity) | Capacity of the auto-scaling group being used for the worker groups. | `number` | `1` | no |
| <a name="input_worker_groups_instance_type"></a> [worker\_groups\_instance\_type](#input\_worker\_groups\_instance\_type) | Type of instance to be used for the worker groups. | `string` | `"t2.small"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | Endpoint for EKS control plane. |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | EKS cluster ID. |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Kubernetes cluster name. |
| <a name="output_cluster_security_group_id"></a> [cluster\_security\_group\_id](#output\_cluster\_security\_group\_id) | Security group IDs attached to the cluster control plane. |
| <a name="output_config_map_aws_auth"></a> [config\_map\_aws\_auth](#output\_config\_map\_aws\_auth) | A Kubernetes configuration to authenticate to this EKS cluster. |
| <a name="output_kubectl_config"></a> [kubectl\_config](#output\_kubectl\_config) | kubectl config as generated by the module. |
| <a name="output_region"></a> [region](#output\_region) | AWS region. |
<!-- END_TF_DOCS -->

# Additional Information

Before running the Terraform scripts, make sure to set the [IAM required permissions](./iam-required-permissions.md) first. You will have to remove the comments in the code if you decide to copy/paste them. Remember it is a best practice to use a role and assign this permissions as a managed policy rather than inline.


## Instructions

1. Make sure you have the following installed and configured:
- AWS CLI
- AWS IAM Authenticator
- kubectl
- wget
2. Set your working directory to: this directory
3. Execute:
```shell
terraform init
```
4. Execute:
```shell
terraform apply
```
5. Confirm the apply with a:
```shell
yes
```
6. Execute:
```shell
terraform apply
```
7. At this point you can configure **kubectl**:
```shell
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
```
8. What you decide to do next is up to you; the cluster is ready for you to work with it.
9. Clean up:
```shell
terraform destroy
```
