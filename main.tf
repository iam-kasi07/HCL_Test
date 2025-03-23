provider "aws" {
  region = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key  
  
}

module "vpc" {
  source = "./modules/vpc"
  aws_security_group_name = var.aws_security_group_name
  aws_vpc_name = var.aws_vpc_name
  aws_vpc_cidr = var.aws_vpc_cidr
  aws_public_subnet_cidr = var.aws_public_subnet_cidr
  aws_private_subnet_cidr = var.aws_private_subnet_cidr

}

module "S3" {
  source = "./modules/S3"
  aws_s3_bucket_name = var.aws_s3_bucket_name
  object_lock_enabled = var.object_lock_enabled
  tags = var.tags
}

module "ECR" {
  source = "./modules/ECR"
  aws_ecr_repo_name = var.aws_ecr_repo_name
  image_tag_mutability = var.image_tag_mutability
  scan_on_push = var.scan_on_push
  
}