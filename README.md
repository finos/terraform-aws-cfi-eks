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

JP README
# EKS - Terraform

## Supported Versions

1. Terraform
- required_version = "~> 0.14"

2. Terraform AWS
- source  = "hashicorp/aws"
- version = ">= 3.20.0"

3. Terraform Kubernetes
- source  = "hashicorp/kubernetes"
- version = ">= 2.0.1"

4. AWS EKS
- cluster_version = "1.18"

## Instructions

1. Make sure you have the following installed and configured:
- AWS CLI
- AWS IAM Authenticator
- kubectl
- wget
2. Set your working directory to: **eks-terraform-scripts**.
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

EKS.md
# EKS

This document is meant to provide an opinionated approach towards the implementation of security controls, by domain, in EKS. Although the approaches may not be fit for all use cases or complete for production use, they are meant to guide the reader towards current best practices and design considerations to achieve security control objectives.

## Terms

- Amazon = AWS
- Identity & Access Management = IAM
- Kubernetes = K8s
- Role-based Access Control = RBAC

## Components & Shared Responsibility

An EKS cluster consists of two primary components:

- EKS control plane
- EKS nodes registered with the control plane

From a shared responsibility model perspective, AWS is responsible for the EKS control plane.

The EKS control plane is composed of:

- at least two API server nodes
- three etcd nodes

AWS provisions the cluster's control plane, within an AWS-managed VPC, across multiple availability zones (AZs) and is fronted by an elastic load balancing (ELB) network load balancer (NLB).

It also provisions EKS-managed elastic network interfaces (ENIs) in your VPC subnets to provide connectivity from the control plane instances to the nodes.

As for the customer, the responsibility is to look after: IAM, pod security, runtime security, and network security.

## VPC

AWS recommends the user to create a VPC with public and private subnets so that K8s can create public load balancers in the public subnets that load balance traffic to pods running on nodes that are in private subnets.

## Controls and Architecture Best Practices

This table maps each security domain to the corresponding controls and architectural best practices as documented in EKS’s public documentation, white papers, and blog posts.

| **Security Domain** | **Controls & Architectural Best Practices** | **Reference(s)** |
| ------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Encryption** |
| Encryption - Data at Rest | By default, all of the data stored by etcd nodes and associated AWS EBS volumes is encrypted using AWS KMS.<br/><br/>When a new cluster is created, you can choose to enable envelope encryption of K8s secrets using AWS KMS.<br/><br/>If you enable envelope encryption, the K8s secrets are encrypted using the customer master key (CMK) that you select.<br/><br/>The CMK must be symmetric and created in the same region as the cluster. If the CMK was created with a different account, the user must have access to the CMK.<br/><br/>Enable envelop encryption.<br/><br/>Otherwise, secrets won't be encrypted, just stored as base64 in etcd. Furthermore, this can't be changed once the cluster has been created. |
| **Infrastructure** |
| Infrastructure - Cluster Endpoint(s) Access | When a new cluster is created, EKS creates an endpoint for the EKS-managed K8s API server that you use to communicate with your cluster.<br/><br/>By default, this K8s API server endpoint is public to the Internet and access to the K8s API server is secured using a combination of AWS IAM and native K8s RBAC.<br/><br/>When only the public endpoint is enabled, which is the default, K8s API requests that originate from within your cluster's VPC (e.g. node to control plane communication) leave your VPC, but not Amazon's network.<br/><br/>Technically, the following endpoint combinations are supported:<br/>- public endpoint enabled and private endpoint disabled<br/>- public and private endpoints enabled<br/>- private endpoint enabled and public endpoint disabled<br/><br/>Set the cluster endpoint access as private endpoint only.<br/><br/>After setting it to private, EKS creates a Route 53 private hosted zone on your behalf and associates it with your cluster's VPC. Note that this private hosted zone is managed by AWS EKS and it doesn't appear in your account's Route 53 resources.<br/><br/>In order for the private hosted zone to properly route traffic to your API server, your VPC must have **enableDnsHostnames** and **enableDnsSupport** set to true, and the DHCP options set for your VPC must include **AmazonProvidedDNS** in its domain name servers list. | - [Cluster Endpoint Access](https://docs.aws.amazon.com/eks/latest/userguide/cluster-endpoint.html)<br/><br/>- [Working with Private Hosted Zones](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/hosted-zones-private.html)<br/><br/>- [VPC and Subnet Sizing](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html#VPC_Sizing)<br/><br/>- [De-mystifying Cluster Networking for AWS EKS Worker Nodes](https://aws.amazon.com/blogs/containers/de-mystifying-cluster-networking-for-amazon-eks-worker-nodes/) |
| Infrastructure - Worker Nodes | AWS EKS supports:<br/>- AWS EC2: managed node groups<br/>- AWS EC2: self-managed nodes<br/>- AWS Fargate<br/><br/>Security considerations must be taken if you choose to use self-managed nodes.<br/><br/>If access is required to the worker nodes, instead of enabling SSH access, use SSM Session Manager to remote into them. It provides an audit trail and log of the commands that were run on the instance. | - [EKS Worker Nodes](https://aws.github.io/aws-eks-best-practices/hosts/) |
| Infrastructure - Storage | EKS supports three AWS native storage options:<br/>- EBS<br/>- EBF<br/>- FSx for Lustre<br/><br/>All three offer encryption at rest using a service managed key or a customer managed key. | - [K8s AWS EBS](https://kubernetes.io/docs/concepts/storage/storage-classes/#aws-ebs) |
| **Logging & Monitoring** | AWS EKS control plane logging provides audit and diagnostic logs directly from the AWS EKS control plane to AWS CloudWatch Logs in your account. Furthermore, you can enable or disable each log type on a per-cluster basis.<br/><br/>Monitor at the very least: **api** and **audit** logs. Also, put special attention to changes on RBAC objects: Roles, RoleBindings, ClusterRoles, and ClusterRoleBindings. | - [EKS Control Plane Logging](https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html) |
| **Networking & Isolation** |
| Networking & Isolation - Security Groups | EKS clusters, starting with K8s version 1.14 and platform version **eks.3**, create a cluster security group when they are created.<br/><br/>**A cluster security group is designed to allow all traffic from the control plane and managed node groups to flow freely between each other.** By assigning the cluster security group to the control plane cross-account network interfaces and the managed node group instances, you don't need to configure complex security group rules to allow this communication.<br/><br/>When you create an EKS cluster with versions ealier to both of the referenced above, EKS requires you to specify a security group.<br/><br/>This security group effectively becomes the cluster security group.<br/><br/>Use a dedicated security group for each cluster control plane (one per cluster).<br/><br/>If this security group is shared with other resources, you might block or disrupt connections to those resources. Furthermore, it will affect maintainability and traceability. | - [AWS EKS Security Group Considerations](https://docs.aws.amazon.com/eks/latest/userguide/sec-group-reqs.html) |
| **Authentication** | EKS natively supports:<br/>- webhook token authentication<br/>- service account tokens<br/><br/>K8s natively supports:<br/>- bearer tokens<br/>- client certificates<br/>- authenticating proxy, e.g. LDAP, SAML, Kerberos, alternate x509 schemes, OIDC, etc.<br/>- HTTP basic auth<br/><br/>The webhook token authentication strategy, which is native in K8s, calls a webhook that verifies bearer tokens.<br/><br/>On EKS, these bearer tokens are generated by the AWS CLI or the **aws-iam-authenticator** client when kubectl commands are executed.<br/><br/>By using the AWS CLI, from version 1.16.156 onwards, the authentication token can be manually generated by:<br/><br/>**aws eks get-token --cluster-name \<value\> [--role-arn \<value\>]**<br/><br/>**role-arn** indicates the role to assume for credentials when signing the token.<br/><br/>Each token starts with **k8s-aws-v1.**, followed by a base64 encoded string.<br/><br/>In other words, the token itself is a pre-signed URL (AWS STS) and it has a TTL of 15 minutes.<br/><br/>Actions:<br/>- Don't use a service account token for authentication.<br/>- Employ least privileged access to AWS resources.<br/>- Use IAM roles when multiple users need identical access to the cluster: map roles to RBAC groups.<br/>- Employ least privileged access when creating RoleBindings and ClusterRoleBindings.<br/>- Regularly audit access to the cluster. | - [K8s Authentication](https://kubernetes.io/docs/reference/access-authn-authz/authentication/)<br/>- [K8s Webhook Token Authentication](https://kubernetes.io/docs/reference/access-authn-authz/authentication/#webhook-token-authentication)<br/>- [AWS IAM Authenticator](https://github.com/kubernetes-sigs/aws-iam-authenticator)<br/>- [EKS API - get-token](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/eks/get-token.html) |
| **Authorization** | When a cluster is created, the IAM entity (e.g. user, role, federated user, etc.) that creates it is automatically granted **system:masters** permissions in the cluster's RBAC configuration.<br/><br/>This is achieved by the creation of a ConfigMap named **aws-auth** in the **kube-system** namespace.<br/><br/>In other words, the ConfigMap is used to handle the IAM users and roles permissions within the cluster. The ConfigMap also handles the nodes joining the cluster. | - [Managing Users or IAM Roles for Your Cluster](https://docs.aws.amazon.com/eks/latest/userguide/add-user-role.html) |
| Authorization - IAM Roles for Service Accounts - IRSA | This feature allows assigning an IAM role to a K8s service account. It works by leveraging a K8s feature known as **Service Account Token Volume Projection**.<br/><br/>Pods with service accounts that reference an IAM role call a public OIDC discovery endpoint for AWS IAM upon pod's startup. The endpoint cryptographically signs the OIDC toekn issued by K8s which ultimately allows the pod to call the AWS APIs associated IAM role.<br/><br/>When an AWS API is invoked, within the pod, the AWS SDKs calls **sts:AssumeRoleWithIdentity** and automatically exchanges the K8s issued token for an AWS temporary credential.<br/><br/>A mutating webhook that runs as part of the EKS control plane injects the AWS Role ARN and the path to a web identity token file into the pod as environment variables:<br/>- AWS_ROLE_ARN<br/>- AWS_WEB_IDENTITY_TOKEN_FILE<br/><br/>The kubelet will automatically rotate the projected token when it is older than 80% of its total TTL or after 24 hours. The AWS SDKs are responsible for reloading the token when it rotates.<br/><br/>Actions:<br/>- Update the aws-node daemonset to use IRSA.<br/>- Restrict access to the instance profile assigned to the worker node.<br/>- Scope the IAM role trust policy for IRSA to the service account name.<br/>- When the application needs access to IDMS, use IDMSv2 and increase the hop limit on EC2 instances to 2.<br/>- Disable auto-mounting of service account tokens.<br/>- Use dedicated service accounts for each application.<br/>- Run the application as a non-root user.<br/>- Grant least privileged access to applications. | - [Restrict Access to the Instance Profile Assigned to the Worker Node](https://aws.github.io/aws-eks-best-practices/iam/#restrict-access-to-the-instance-profile-assigned-to-the-worker-node)