variable "service_account_id" {
  type = string
}

variable "service_account_display_name" {
  type = string
}

variable "service_account_roles" {
  type = list(string)
}

variable "gke-cluster-name" {
  type = string
}

variable "gke-cluster-zone" {
  type = string
}
variable "gke-node-pool-name" {
  type = string
}
variable "gke-node-pool-zone" {
  type = string
}
variable "gke-node-pool-machine-type" {
  type = string
}