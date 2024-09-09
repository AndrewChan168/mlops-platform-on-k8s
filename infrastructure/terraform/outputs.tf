output "vpc_arn" {
  description   = "ARN of VPC"
  value         = module.vpc.vpc_arn
}

output "vpc_ip" {
    description = "ID of VPC"
    value       = module.vpc.vpc_ip
}

output "public_subnet_arn" {
  description   = "ARN of Public subnet"
  value         = module.vpc.public_subnet_arn
}

output "public_subnet_id" {
    description = "The ID of public subnet"
    value       = module.vpc.public_subnet_id
}

output "private_subnet_arn" {
  description   = "ARN of Private subnet"
  value         = module.vpc.private_subnet_arn
}

output "private_subnet_id" {
    description = "The ID of Private subnet"
    value       = module.vpc.private_subnet_id
}