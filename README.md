# Azure SignalR Service Chat Sample
- This sample demonstrates how to use Azure SignalR Service with ASP.NET Core SignalR.

## Prerequisites
- .NET 8.0 SDK or later
- An Azure SignalR Service instance
- Docker (optional, for containerized deployment)

## Setup

1. Initialize the required submodules:

```bash
git submodule update --init --recursive
```

2. Configure your Azure SignalR Service connection string:

   - Update `appsettings.json` by replacing the empty connection string:

    ```json
    {
      "Azure": {
        "SignalR": {
          "ConnectionString": "<your-connection-string>"
        }
      }
    }
    ```

⚠️ **Important**: Make sure to set your connection string before building the Docker image or running the application.

## Running the Sample

### Option 1: Running Locally

1. Build and run the project:

```bash
dotnet build
dotnet run
```

You can also specify a custom port:

```bash
docker run -d -p 7134:7134 chat-app
```

### References
+ [SignalR Chat Sample](https://github.com/Azure/azure-signalr/tree/dev/samples/ChatSample/ChatSample)
