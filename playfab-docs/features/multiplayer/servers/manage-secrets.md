---
title: Manage secrets (Preview)
author: jvalenciano
description: This document provides information on the secret management feature that enables customers to deploy secrets into game servers securely.
ms.author: jvalenciano
ms.date: 4/22/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, servers, vm, startup, script
ms.localizationpriority: medium
---

# Manage secrets

With this new feature, game developers can securely upload, list, update, and use secrets like instrumentation keys and secret keys on game servers.

## How to use the secret management feature

To effectively manage and utilize secrets, the recommended workflow includes:

1. Adding secrets (this step can be repeated for multiple secrets)
1. Referencing secrets by name when creating a new build
1. Accessing secrets from your game server
1. Updating secrets as necessary

### Adding secrets

Secrets can be added via the [UploadSecret](/rest/api/playfab/multiplayer/multiplayer-server/upload-secret) API.
This API allows for the uploading of a new secret to the service, or the updating of an existing secret with the **ForceUpdate** parameter set to **true**.

### Deploying secrets

To deploy secrets in newly created VMs, incorporate the secret in a build using the GameSecretReferences parameter in the CreateBuild APIs (applicable to both container and process-based deployments).
> [!Note]
> Once a build is created, it is not possible to add new secrets to it; however, updating an existing secret will allow its updated value to be used in new VMs (existing VMs will retain the original values).

Here's an example of how to reference the secrets:

```csharp
var request = new CreateBuildWithCustomContainerRequest()
{
    ContainerImageReference = new ContainerImageReference()
    {
        ImageName = "testimagename",
        Tag = "0.1"
    },
    ContainerFlavor = ContainerFlavor.CustomLinux,
    BuildName = "testbuildwithvmstartupscript",
    VmSize = AzureVmSize.Standard_D2as_v4,
    MultiplayerServerCountPerVm = 3,
    Ports = new List<Port>
    {
        new Port()
        {
            Name = "port",
            Num = 123,
            Protocol = ProtocolType.TCP
        }
    },
    RegionConfigurations = new List<BuildRegionParams>
    {
        new BuildRegionParams()
        {
            Region = "EastUs",
            StandbyServers = 3,
            MaxServers = 6
        }
    },
    GameSecretReferences = new[]
    {
        new GameSecretReferenceParams
        {
            Name = "SecretName"
        }
    }
};
var result = await PlayFabMultiplayerAPI.CreateBuildWithCustomContainerAsync(request);
```

### Accessing secrets

Once secrets are added and referenced in new builds, game servers can access these secret values through environment variables within each game server, whether container-based or process-based.

The naming convention for the environment variables is:
```shell
PF_MPS_SECRET_<Secret Name>
```

### Deleting secrets

To remove an old secret, utilize the DeleteSecret [DeleteSecret](/rest/api/playfab/multiplayer/multiplayer-server/delete-secret) API.

Make sure the secret isn't used in any build before you try to delete it, otherwise the deletion won't be successful.

## Use secrets in VM startup scripts

VM startup scripts can utilize the secret values by referencing the environment variables as described. This enables, for instance, the use of telemetry keys or other necessary values before initiating any game server.

## See also

* [Deploy builds using PowerShell/API](deploy-using-powershell-api.md)
* [Running custom script during VM creation - VmStartupScript (preview)](vmstartupscript.md)
