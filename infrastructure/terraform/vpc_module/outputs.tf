output "vpc_arn" {
  description   = "ARN of VPC"
  value         = aws_vpc.k8s_vpc.arn
}

output "vpc_ip" {
    description = "ID of VPC"
    value       = aws_vpc.k8s_vpc.id
}

output "public_subnet_arn" {
  description   = "ARN of Public subnet"
  value         = aws_subnet.public.arn
}

output "public_subnet_id" {
    description = "The ID of public subnet"
    value       = aws_subnet.public.id
}

output "private_subnet_arn" {
  description   = "ARN of Private subnet"
  value         = aws_subnet.private.arn
}

output "private_subnet_id" {
    description = "The ID of Private subnet"
    value       = aws_subnet.private.id
}