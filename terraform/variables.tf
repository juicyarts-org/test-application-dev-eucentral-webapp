variable "location" {
  type        = string
  default     = "westeurope"
  description = "Azure Region where the resources get deployed"
  validation {
    condition     = contains(["northeurope", "westeurope", "europe", "germanywestcentral", "germanynorth", "germany"], var.location)
    error_message = "Region not allowed. Following regions can be choosen: [northeurope, westeurope, europe, germanywestcentral, germanynorth, germany]"
  }
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group"
}

variable "app_name" {
  type        = string
  description = "Name of the Application"
}
