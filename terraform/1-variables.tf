variable "credentials" {
  description = "Path to the GCP credentials file"
  type        = string
  default     = "~/.gcp/terraform-service-account.json"
}

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The region to create resources in"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The zone to create resources in"
  type        = string
  default     = "us-central1-a"
}

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
  default     = 2
}

variable "gce_ssh_user" {
  description = "The SSH user to use when connecting to the GCE instances"
  type        = string
  default     = "ansible"
}

variable "ssh_key" {
  description = "Path to the SSH public key"
  type        = string
  default     = "~/.ssh/vms.pub"
}