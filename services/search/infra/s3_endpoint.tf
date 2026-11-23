variable "vpc_id" {
  type        = string
  description = "VPC that hosts the search service private subnets."
}

variable "private_route_table_ids" {
  type        = list(string)
  description = "Route tables of the search service private subnets."
}

# Keep S3 traffic (index snapshot restores) off the shared NAT gateway.
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = var.private_route_table_ids
  tags              = { owner = "search-team", project = "search", service = "search" }
}
