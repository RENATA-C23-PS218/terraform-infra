variable "bucket_name" {
  type        = string
  description = "Name for the bucket"
  default     = "renata-dev-soil-bucket"
}

variable "region" {
  type        = string
  description = "Region for the bucket"
}

variable "tf_state_bucket_name" {
  type        = string
  description = "Name for the bucket"
  default     = "tf-state-renata-dev-bucket"
}