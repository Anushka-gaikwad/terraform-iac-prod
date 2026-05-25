# -----------------------------------------------------------------------------
# General
# -----------------------------------------------------------------------------
variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "ap-south-1"
}

variable "environment" {
  description = "Environment name (e.g. staging, production)"
  type        = string
}

variable "project" {
  description = "Project name used for resource naming and tagging"
  type        = string
  default     = "nodejs-app"
}

variable "owner" {
  description = "Owner tag for all resources"
  type        = string
  default     = "devops-team"
}

variable "cost_center" {
  description = "Cost center tag for billing"
  type        = string
  default     = "engineering"
}

# -----------------------------------------------------------------------------
# Networking
# -----------------------------------------------------------------------------
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets (one per AZ)"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets (one per AZ)"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "isolated_subnet_cidrs" {
  description = "CIDR blocks for isolated/database subnets (one per AZ)"
  type        = list(string)
  default     = ["10.0.21.0/24", "10.0.22.0/24"]
}

# -----------------------------------------------------------------------------
# Compute
# -----------------------------------------------------------------------------
variable "ami_id" {
  description = "AMI ID for EC2 instances (Amazon Linux 2023)"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.medium"
}

variable "app_port" {
  description = "Port the Node.js application listens on"
  type        = number
  default     = 3000
}

variable "min_size" {
  description = "Minimum ASG instance count"
  type        = number
  default     = 2
}

variable "desired_capacity" {
  description = "Desired ASG instance count"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum ASG instance count"
  type        = number
  default     = 6
}

variable "cpu_target" {
  description = "Target CPU utilization percentage for auto scaling"
  type        = number
  default     = 60
}

variable "enable_scheduled_scaling" {
  description = "Enable scheduled scaling for known traffic patterns"
  type        = bool
  default     = false
}

variable "key_name" {
  description = "EC2 key pair name (optional, SSM preferred)"
  type        = string
  default     = ""
}

variable "app_s3_bucket" {
  description = "S3 bucket containing the application artifact"
  type        = string
  default     = ""
}

# -----------------------------------------------------------------------------
# Load Balancer & SSL
# -----------------------------------------------------------------------------
variable "acm_certificate_arn" {
  description = "ARN of the ACM certificate for HTTPS"
  type        = string
}

variable "enable_stickiness" {
  description = "Enable ALB target group stickiness"
  type        = bool
  default     = false
}

# -----------------------------------------------------------------------------
# WAF
# -----------------------------------------------------------------------------
variable "waf_rate_limit" {
  description = "WAF rate limit (requests per 5 minutes per IP)"
  type        = number
  default     = 2000
}

variable "enable_waf_logging" {
  description = "Enable WAF logging to CloudWatch"
  type        = bool
  default     = true
}

# -----------------------------------------------------------------------------
# Monitoring
# -----------------------------------------------------------------------------
variable "alarm_email" {
  description = "Email address for CloudWatch alarm notifications"
  type        = string
  default     = ""
}

# -----------------------------------------------------------------------------
# Database
# -----------------------------------------------------------------------------
variable "allowed_db_ports" {
  description = "List of database ports to allow from EC2 security group"
  type        = list(number)
  default     = [5432]
}
