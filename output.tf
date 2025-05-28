#output "kms_key_id" {
#  value = module.kms.key_id
#}

output "s3_bucket" {
  value = module.s3.bucket_name
}


output "aurora_cluster_endpoint" {
  value = module.rds_cluster.cluster_endpoint
}

output "aurora_reader_endpoint" {
  value = module.rds_cluster.reader_endpoint
}


output "rds_secret_arn" {
  value = module.rds_credentials_secret.secret_arn
}

output "rds_secret_id" {
  value = module.rds_credentials_secret.secret_id
}
