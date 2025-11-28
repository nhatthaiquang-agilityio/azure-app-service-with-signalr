environment = "test"
resource_group_name="rg-signal-example"

# SignalR Settings
signalr_name = "signalr-test-example"
allowed_origins = ["https://localhost:7134", "https://appservice-test-example.azurewebsites.net"]
public_network_access_enabled = true

tags = {
  environment = "test"
  project     = "signalr-example"
}

app_service_name = "appservice-test-example"