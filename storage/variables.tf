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

variable "sa_name" {
  type        = string
  description = "Name for the service account"
  default     = "renata-dev-avatar-profile"
}

variable "roles_sa_bucket" {
  type        = list(string)
  description = "The roles to be assigned to the service account"
  default     = ["roles/storage.objectCreator", "roles/storage.objectViewer"]
}

variable "project_id" {
  type        = string
  description = "The project ID to use"
}