output "cluster_endpoint" {
  value = aws_rds_cluster.this.endpoint
}

output "reader_endpoint" {
  value = aws_rds_cluster.this.reader_endpoint
}

output "cluster_arn" {
  value = aws_rds_cluster.this.arn
}
