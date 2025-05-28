resource "aws_rds_cluster" "this" {
  cluster_identifier      = var.cluster_identifier
  engine                  = "aurora-postgresql"
  engine_version          = var.engine_version
  master_username         = var.master_username
  master_password         = var.master_password
  database_name           = var.database_name
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  storage_encrypted       = true
  kms_key_id              = var.kms_key_id
  vpc_security_group_ids  = var.security_group_ids
  db_subnet_group_name    = var.subnet_group_name
  skip_final_snapshot     = true
  enable_http_endpoint    = true
  final_snapshot_identifier = "aurora-last-snapshot"
}

resource "aws_rds_cluster_instance" "this" {
  count                = var.instance_count
  identifier           = "${var.cluster_identifier}-instance-${count.index + 1}"
  cluster_identifier   = aws_rds_cluster.this.id
  instance_class       = var.instance_class
  engine               = aws_rds_cluster.this.engine
  engine_version       = aws_rds_cluster.this.engine_version
  publicly_accessible  = var.publicly_accessible
  db_subnet_group_name = var.subnet_group_name
}
