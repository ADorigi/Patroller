# workload_identity_pool_id = "gh-swath-pool"
#   display_name              = "Swath Github actions pool"
#   description               = "Identity pool to allow swath github actions to access gcp resources"
#   disabled                  = false

variable "workload_identity_pool_id" {
  type = string
}
variable "idenity_pool_name" {
  type = string
}
variable "idenity_pool_description" {
  type = string
}

variable "identity_pool_provider_id" {
  type = string
}
variable "identity_pool_provider_attributes" {
  type = map(string)
}
variable "identity_pool_provider_issuer_uri" {
  type = string
}
variable "service_account_id" {
  type = string
}

variable "service_account_display_name" {
  type = string
}

variable "repository_name" {
  type = string
}