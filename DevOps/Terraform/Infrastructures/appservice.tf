resource "azurerm_app_service_plan" "app_service_plan" {
    name                = "${var.app_service_name}-asp"
    location            = data.azurerm_resource_group.rg.location
    resource_group_name = data.azurerm_resource_group.rg.name
    kind                = "Windows"

    sku {
			tier = "Standard"
			size = "S1"
    }
}

resource "azurerm_app_service" "app_service" {
	name                = var.app_service_name
	location            = data.azurerm_resource_group.rg.location
	resource_group_name = data.azurerm_resource_group.rg.name
	app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

	client_affinity_enabled           = true
	site_config {
		scm_type                 = "LocalGit"
		always_on                            = true
    dotnet_framework_version             = "v8.0"
	}

	tags     			  			= merge(var.tags, {
		environment = var.environment
	})

	app_settings = {
		"WEBSITE_RUN_FROM_PACKAGE" = "1",
		AzureSignalRConnectionString = azurerm_signalr_service.signalr_example.primary_connection_string
	}
}