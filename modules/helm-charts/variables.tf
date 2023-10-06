variable "acr_server" {
  description = "The target Azure Container Registry where charts will be copied."
}

variable "acr_server_subscription" {
  description = "The subscription ID of the target Azure Container Registry."
}

variable "source_acr_client_id" {
  description = "Client ID of a service principal with access to the source ACR."
}

variable "source_acr_client_secret" {
  description = "Client secret of the service principal with access to the source ACR."
}

variable "source_acr_server" {
  description = "The source Azure Container Registry where charts will be copied from."
}

variable "charts" {
  description = "List of charts to copy and install."
  type        = list(object({
    chart_name        = string
    chart_namespace   = string
    chart_repository  = string
    chart_version     = string
    values            = list(object({
        name = string
        value = string
    }))
    sensitive_values  = list(object({
        name = string
        value = string
    }))
  }))
}