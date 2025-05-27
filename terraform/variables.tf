variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "laravel-hello-world"
}

variable "environment" {
  description = "Environment"
  type        = string
  default     = "development"
}

variable "bundle_id" {
  description = "Lightsail bundle ID"
  type        = string
  default     = "micro_2_0" # 1 GB RAM, 1 vCPU, 40 GB SSD
}