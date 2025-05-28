variable "bucket_name" {
  type        = string
  description = "Nombre S3"
}

variable "kms_key_arn" {
  type        = string
  description = "ARN del KMS"
}
