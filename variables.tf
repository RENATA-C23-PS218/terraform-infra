variable "project_id" {
  type        = string
  description = "Project ID from Google Cloud Console"
}

variable "region" {
  type        = string
  description = "Region to Deploy the Infrastructure"
}

variable "zone" {
  type        = string
  description = "Zone to Deploy the Infrastructure"
}

variable "service_account" {
  type        = string
  description = "Service Account email"
}