
output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the VPC"
}

output "public_subnet_ids" {
  value = [for subnet in aws_subnet.public : subnet.id]
  description = "List of IDs for public subnets"
}

output "private_subnet_ids" {
  value = [for subnet in aws_subnet.private : subnet.id]
  description = "List of IDs for private subnets"
}

output "nat_gateway_ids" {
  value = [for nat in aws_nat_gateway.nat : nat.id]
}
output "nat_eip_allocation_ids" {
  value = [for eip in aws_eip.nat : eip.allocation_id]
}

output "public_subnet_cidrs" {
  value       = var.public_subnet_cidrs
  description = "Map of availability zones to public subnet CIDR blocks"
}


output "private_subnet_cidrs" {
  value       = var.private_subnet_cidrs
  description = "Map of availability zones to private subnet CIDR blocks"
}

