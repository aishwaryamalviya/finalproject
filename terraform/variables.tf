variable "resource_group_name" {
  default     = "aks_terraform_rg"
  type        = string
  description = "RG name in Azure"
}

variable "location" {
  default     = "West Europe"
  type        = string
  description = "Resources location in Azure"
}

variable "cluster_name" {
  default     = "terraform-aks"
  type        = string
  description = "AKS name in Azure"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version"
}

variable "system_node_count" {
  type        = number
  description = "Number of AKS worker nodes"
}

variable "node_resource_group" {
  type        = string
  description = "RG name for cluster resources in Azure"
}
variable "acr_name" {
  type        = string
  description = "ACR name"
}
variable "storage_account_name" {
  type        = string
  description = "storage_account_name"
}
variable "storage_container_name" {
  type        = string
  description = "storage_container_name"
}
