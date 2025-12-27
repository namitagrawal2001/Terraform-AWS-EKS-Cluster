module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.29.0"

  cluster_name                   = local.name
  cluster_endpoint_public_access = true

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.intra_subnets

  cluster_addons = {
    vpc-cni = { most_recent = true }
    kube-proxy = { most_recent = true }
    coredns = { most_recent = true }
  }

  eks_managed_node_group_defaults = {
    instance_types = ["t2.medium"]
    capacity_type  = "SPOT"
  }

  eks_managed_node_groups = {
    tws_node_group = {
      min_size     = 2
      max_size     = 3
      desired_size = 2
    }
  }

  tags = {
    Terraform   = "true"
    Environment = local.env
  }
}
