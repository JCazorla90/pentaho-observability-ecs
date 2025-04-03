provider "aws" {
  region = "eu-west-1"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"

  name = "pentaho-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]

  enable_nat_gateway = false
  single_nat_gateway = false

  tags = {
    Name = "pentaho-vpc"
  }
}

module "ecs_cluster" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "4.0.0"

  cluster_name = "pentaho-observability-cluster"
  capacity_providers = ["FARGATE"]
}
