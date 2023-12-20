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
variable "gke-zone" {
  type = string
}

variable "gke-node-pool-name" {
  type = string
}

variable "gke-node-pool-machine-type" {
  type = string
}
variable "spot-node-pool" {
  type = bool
}

variable "gke-cluster-networking-mode" {
  type = string
}

variable "gke-network" {
  type = string
}
variable "gke-subnetwork" {
  type = string
}

variable "cluster-range-name" {
  type = string
}
variable "services-range-name" {
  type = string
}
