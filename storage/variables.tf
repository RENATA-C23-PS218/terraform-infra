variable "bucket_name_soil" {
  type        = string
  description = "Name for the bucket"
  default     = "renata-dev-soil"
}

#variable "bucket_name_profile" {
#  type        = string
#  description = "Name for the bucket"
#  default     = "renata-dev-profile"
#}

variable "region" {
  type        = string
  description = "Region for the bucket"
}

variable "tf_state_bucket_name" {
  type        = string
  description = "Name for the bucket"
  default     = "tf-state-renata-dev-bucket"
}