# VPC CIDR
variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC"
}

# Public Subnet CIDRs
variable "public_subnet_cidrs" {
  type        = map(string)
  description = "Map of availability zones to public subnet CIDR blocks"
}

# Private Subnet CIDRs
variable "private_subnet_cidrs" {
  type        = map(string)
  description = "Map of availability zones to private subnet CIDR blocks"
}

# Common Tags
variable "common_tags" {
  type        = map(string)
  description = "Common tags to apply to resources"
}
