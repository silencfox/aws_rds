variable "secret_name" {
  type        = string
  description = "Nombre del secreto"
}

variable "description" {
  type        = string
  default     = ""
  description = "Descripción del secreto"
}

variable "secret_values" {
  type        = map(string)
  description = "Valores del secreto"
}

variable "kms_key_id" {
  type        = string
  description = "ID del KMS"
}
