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
  name = "rag-platform-prod"
  tags = {
    Project     = "RAG-PDF-Chat-Multi-Agent-Pipeline"
    Environment = "production"
    Owner       = "platform"
    ManagedBy   = "terraform"
  }
}

module "network" {
  source = "../../modules/network"
  name   = local.name
  vpc_cidr = "10.40.0.0/16"
  public_subnets = {
    a = { cidr = "10.40.0.0/20", az = "${var.aws_region}a" }
    b = { cidr = "10.40.16.0/20", az = "${var.aws_region}b" }
    c = { cidr = "10.40.32.0/20", az = "${var.aws_region}c" }
  }
  private_subnets = {
    a = { cidr = "10.40.128.0/20", az = "${var.aws_region}a" }
    b = { cidr = "10.40.144.0/20", az = "${var.aws_region}b" }
    c = { cidr = "10.40.160.0/20", az = "${var.aws_region}c" }
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
  db_instance_class  = "db.r6g.large"
  db_username        = var.db_username
  db_password        = var.db_password
  redis_node_type    = "cache.r7g.large"
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

module "observability" {
  source            = "../../modules/observability"
  name              = local.name
  environment       = "production"
  alarm_dimensions  = { LoadBalancer = "app/${local.name}/placeholder" }
  tags              = local.tags
}
