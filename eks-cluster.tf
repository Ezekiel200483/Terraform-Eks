module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.0.7"

  name               = local.cluster_name
  kubernetes_version = var.kubernetes_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_irsa = true

  eks_managed_node_groups = {
    node_group = {
      instance_types = ["t3.medium"]
      
      min_size     = 2
      max_size     = 6
      desired_size = 2

      ami_type = "AL2_x86_64"
      
      vpc_security_group_ids = [aws_security_group.all_worker_mgmt.id]
    }
  }

  tags = {
    cluster = "demo"
  }
}

