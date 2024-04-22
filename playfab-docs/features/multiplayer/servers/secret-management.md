---
title: Run custom script during VM creation (preview)
author: jvalenciano
description: Documentation about the Secret Management feature that allows customer to deploy secrets into game servers
ms.author: jvalenciano
ms.date: 22/04/2024
ms.topic: article
ms.service: playfab
keywords: playfab, multiplayer, servers, vm, startup, script
ms.localizationpriority: medium
---

# Deploying secrets to MPS game servers

## Introduction

Sometimes customers have some secret values that want to deploy inside a game server, i.e. instrumentation keys, application ID secrets, passwords, etc. These values must be saved securely and accessed only inside the VMs.

## How to use the secret management feature
To manage the secrets inside the VMs you need to first add your secrets individually and then reference them in your builds by secret name.

## How to add secrets
You can add secrets using the UploadSecret API **ADD LINK HERE**. Using this API, you can create a new secret or renew an old value using the ForceUpdate API parameter in **true**.

## How to deploy the secrets in the game servers
To deploy a secret in newly created VMs, you need to add the secret value into a build. To do so, you use the GameSecretReferences in the CreateBuild APIs (container and process based ones) after adding the secret in the step above.

It is not possible to add secrets once a build has been created. However, you can renew the value of a secret and use this new value in newly created VMs (old VMs will remain with the old values).

This is an example on how to reference the secrets:
```csharp
var request = new CreateBuildWithCustomContainerRequest()
{ 
    ContainerImageReference = new ContainerImageReference()
    {
         ImageName= "testimagename",
         Tag= "0.1"
    },
    ContainerFlavor = ContainerFlavor.CustomLinux,
    BuildName = "testbuildwithvmstartupscript",
    VmSize = AzureVmSize.Standard_D2as_v4,
    MultiplayerServerCountPerVm = 3,
    Ports= new List<Port>
    {
        new Port()
        {
            Name= "port",
            Num= 123,
            Protocol = ProtocolType.TCP   
        }
    },
    RegionConfigurations = new List<BuildRegionParams> { new BuildRegionParams()
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
    },
};
var result = await PlayFabMultiplayerAPI.CreateBuildWithCustomContainerAsync(request);
```

## How to access secrets in game servers
Once the secrets have been added and referenced to new builds, game creators need a way to access the secret values.

To do this, all the referenced secrets will be added in environment variables inside each game server (container or process).

The naming convention for the environment variables is the following:
**PF_MPS_SECRET_`<Secret Name>`**

## How to delete the secrets
To delete an old secret, you can use the DeleteSecret API **LINK HERE**.

You have to make sure that the secret is not referenced in any build. If the secret is still referenced in a build, the secret removal will fail.

## Secret usage in VM Startup Script
VM startup script can use the secret values, referencing the environment variables with the name mentioned above. In this way, for example VM startup script can use telemetry keys or any kind of value necessary before initiating any game server.
