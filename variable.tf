variable "aws_region" {
    description = "AWS region"
    default = "us-east-1"
}

variable "access_key" {
    description = "AWS access key"
    default = "AKIAX3NVJFI7CGVFF5WO"
  
}

variable "secret_key" {
    description = "AWS secret key"
    default = "kY12yzeXVCaap8+vHQshx9Wnp2rRKKIJSED/n54x"
}
variable "aws_security_group_name" {
    description = "Public_SG"
    default = "kasi_hcl_sg"
  
}

variable "aws_vpc_name" {
    description = "VPC name"
    default = "kasi_hcl_vpc"
}   

variable "aws_vpc_cidr" {
    description = "CIDR block for the VPC"
    default = "10.0.0.0/16"  
}

variable "aws_public_subnet_cidr" {
    description = "CIDR block for the subnet"
    default = "10.0.1.0/24"
}

variable "aws_private_subnet_cidr" {
    description = "CIDR block for the subnet"
    default = "10.0.2.0/24" 
}

variable "aws_s3_bucket_name" {
    description = "S3 bucket name"
    default = "kasi_hcl-bucket"
}

variable "object_lock_enabled" {
    description = "Enable object lock"
    default = true
}

variable "tags" {
    description = "Tags for the S3 bucket"
    default = {
        Name        = "kasi_hcl-bucket"
        Environment = "dev"
    }
}

variable "aws_ecr_repo_name" {
    description = "ECR repository name"
    default = "kasi_hcl-repo"
}

variable "image_tag_mutability" {
    description = "Image tag mutability"
    default = "MUTABLE"
}

variable "scan_on_push" {
    description = "Scan on push"
    default = true
}















# name: CI/CD Pipeline

# on:
#   push:
#     branches:
#       - main
#   pull_request:
#     branches:
#       - main

# jobs:
#   build:
#     runs-on: ubuntu-latest

#     services:
#       docker:
#         image: docker:19.03.12
#         options: --privileged
#         ports:
#           - 2375:2375
#         env:
#           DOCKER_TLS_CERTDIR: ""

#     steps:
#     - name: Checkout code
#       uses: actions/checkout@v2

#     - name: Set up Node.js
#       uses: actions/setup-node@v2
#       with:
#         node-version: '14'

#     - name: Install dependencies
#       run: npm install
#       working-directory: Node.js

#     - name: Run tests
#       run: npm test
#       working-directory: Node.js

#     - name: Build Docker image
#       run: docker build -t patient-service:latest .
#       working-directory: Node.js

#     - name: Login to AWS ECR
#       id: login-ecr
#       uses: aws-actions/amazon-ecr-login@v1
#       with:
#         region: ${{ secrets.AWS_REGION }}
#         access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
#         secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}

#     - name: Build, tag, and push Docker image to ECR
#       env:
#         ECR_REGISTRY: ${{ steps.login-ecr.outputs.registry }}
#         ECR_REPOSITORY: kasi_hcl-repo
#         IMAGE_TAG: latest
#       run: |
#         docker tag patient-service:latest $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG
#         docker push $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG

#   deploy:
#     runs-on: ubuntu-latest
#     needs: build

#     steps:
#     - name: Checkout code
#       uses: actions/checkout@v2

#     - name: Set up Terraform
#       uses: hashicorp/setup-terraform@v1

#     - name: Terraform Init
#       run: terraform init

#     - name: Terraform Apply
#       run: terraform apply -auto-approve
#       env:
#         AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
#         AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}