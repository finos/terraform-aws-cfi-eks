locals {
  cluster_name     = "cfi-eks-${random_string.suffix.result}"
  vpc_name         = "cfi-vpc"
  k8s_cluster_name = "cfi-eks-${random_string.suffix.result}-k8s"
}
