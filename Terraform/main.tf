terraform {
  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "TeKanAid"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "backstage-eks-aws"
    }
  }
}

module "eks" {
  source  = "app.terraform.io/TeKanAid/eks/aws"
  version = "0.0.7"

  region               = "us-east-1"
  cluster_version      = "1.27"
  cluster_name         = "my_eks_cluster"
  instance_types       = ["t2.small"]
  vpc_cidr             = "10.0.0.0/16"
  cluster_min_size     = 1
  cluster_max_size     = 3
  cluster_desired_size = 2
}
