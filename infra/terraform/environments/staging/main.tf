terraform {
  required_version = ">= 1.8.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.98"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

locals {
  name = "rag-platform-staging"
  tags = {
    Project     = "RAG-PDF-Chat-Multi-Agent-Pipeline"
    Environment = "staging"
    Owner       = "platform"
    ManagedBy   = "terraform"
  }
}

module "network" {
  source = "../../modules/network"
  name   = local.name
  vpc_cidr = "10.30.0.0/16"
  public_subnets = {
    a = { cidr = "10.30.0.0/20", az = "${var.aws_region}a" }
    b = { cidr = "10.30.16.0/20", az = "${var.aws_region}b" }
  }
  private_subnets = {
    a = { cidr = "10.30.128.0/20", az = "${var.aws_region}a" }
    b = { cidr = "10.30.144.0/20", az = "${var.aws_region}b" }
  }
  tags = local.tags
}

module "security" {
  source = "../../modules/security"
  name   = local.name
  tags   = local.tags
}

module "data" {
  source             = "../../modules/data"
  name               = local.name
  suffix             = var.bucket_suffix
  vpc_id             = module.network.vpc_id
  private_subnet_ids = module.network.private_subnet_ids
  db_instance_class  = "db.t4g.medium"
  db_username        = var.db_username
  db_password        = var.db_password
  redis_node_type    = "cache.t4g.small"
  redis_auth_token   = var.redis_auth_token
  tags               = local.tags
}

module "eks" {
  source             = "../../modules/eks"
  cluster_name       = local.name
  vpc_id             = module.network.vpc_id
  private_subnet_ids = module.network.private_subnet_ids
  tags               = local.tags
}
