resource "aws_kms_key" "eks" {
  description = "EKS secret encryption key."
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = ">=19.0.0, <20.0.0"
  cluster_name    = local.cluster_name
  cluster_version = "1.25"
  subnet_ids      = module.vpc.private_subnets

  cluster_encryption_config = {
    provider_key_arn = aws_kms_key.eks.arn
    resources        = ["secrets"]
  }

  tags = {
    "environment" = "compliant-financial-infrastructure"
  }

  vpc_id = module.vpc.vpc_id

  self_managed_node_group_defaults = {
    root_volume_type = "gp2"
  }

  self_managed_node_groups = [
    {
      name                          = "worker-group-1"
      instance_type                 = var.worker_groups_instance_type
      asg_desired_capacity          = var.worker_groups_asg_desired_capacity
      additional_security_group_ids = [aws_security_group.worker_group_one.id]
    },
    {
      name                          = "worker-group-2"
      instance_type                 = var.worker_groups_instance_type
      asg_desired_capacity          = var.worker_groups_asg_desired_capacity
      additional_security_group_ids = [aws_security_group.worker_group_two.id]
    },
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
