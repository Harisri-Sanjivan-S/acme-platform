# S3 gateway endpoint so S3 traffic from the private subnets bypasses the shared NAT gateway (case N03-02).
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = var.private_route_table_ids

  tags = { owner = "orders-team", project = "orders", service = "orders-service" }
}
