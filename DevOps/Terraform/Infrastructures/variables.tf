variable "environment" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {
    app-name = "Example Az Function"
  }
}

# SignalR Variables
variable "signalr_name" {
    type = string
}

variable "allowed_origins" {
  type = list(string)
  default = []
}

variable "public_network_access_enabled" {
  type = bool
  default = false
}

# App Service Variables
variable "app_service_name" {
  type = string
}