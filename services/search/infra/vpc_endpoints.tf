# S3 gateway endpoint so snapshot restores from private subnets bypass the shared NAT gateway (case D03-02).
variable "vpc_id" {
  type        = string
  description = "ID of the VPC that hosts the search service."
}

variable "private_route_table_ids" {
  type        = list(string)
  description = "Route table IDs of the search service's private subnets."
}

resource "aws_vpc_endpoint" "search_s3" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = var.private_route_table_ids
  tags              = { owner = "search-team", project = "search", service = "search" }
}
