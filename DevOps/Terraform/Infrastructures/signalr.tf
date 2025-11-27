# SignalR Service
resource "azurerm_signalr_service" "signalr_example" {
  name                = var.signalr_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

	tags     			  			= merge(var.tags, {
    environment = var.environment
  })

  sku {
    name     = "Standard_S1"
    capacity = 1
  }

  cors {
    allowed_origins = var.allowed_origins
  }

  public_network_access_enabled = var.public_network_access_enabled

  connectivity_logs_enabled = true
  messaging_logs_enabled    = true
  http_request_logs_enabled = true
  service_mode              = "Default"
}
