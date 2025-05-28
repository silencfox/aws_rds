
resource "random_id" "kms_alias_suffix" {
  byte_length = 4
}

resource "aws_kms_key" "this" {
  description             = var.description
  deletion_window_in_days = 7
  enable_key_rotation     = var.enable_key_rotation
}

resource "aws_kms_alias" "this" {
  name          = "alias/${var.alias_name}-${random_id.kms_alias_suffix.hex}"
  target_key_id = aws_kms_key.this.id
}
