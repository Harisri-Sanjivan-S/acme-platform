# Added by Agentic FinOps case N06-02 after owner approval.
# S3 traffic from the private subnets goes through this gateway endpoint (no charge) instead of the shared NAT gateway.
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = var.private_route_table_ids
  tags              = { owner = "orders-team", project = "orders", service = "orders-service", finops_case = "N06-02" }
}
