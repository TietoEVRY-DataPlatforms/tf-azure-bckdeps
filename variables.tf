variable "tags" {
  type    = map(any)
  default = {}
}

variable "resource_group_name" {
  type = string
}

variable "sa_name" {
  type = string
}

variable "location" {
  type = string
}

variable "msi_name" {
  type = string
}

variable "msi_identities" {
  default = []
}

variable "network_rules" {
  default = []
}

variable "cross_tenant_replication_enabled" {
  description = "Should cross Tenant replication be enabled?"
  default     = false
}
