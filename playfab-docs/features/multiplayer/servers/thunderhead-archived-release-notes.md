---
title: Archived Release Notes- PlayFab Multiplayer Servers (Thunderhead)
author: joannaleecy
description: PlayFab Multiplayer Servers (Thunderhead) release notes.
ms.author: joanlee
ms.date: 01/17/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer servers, thunderhead, release notes
ms.localizationpriority: medium
---

# Archived release notes- PlayFab multiplayer servers (Thunderhead)

## October 12, 2018- Updates to managed containers

We are updating the virtual machine and container configuration to use Windows Server 2016 (1803). Please see [PlayFab Multiplayer Server 2.0 - Managed Container Update](thunderhead-managed-container-update.md) to learn more.

## August 26, 2018- Private preview release notes

## PowerShell

`Get-PFMultiplayerBuild` now uses the ListBuilds API to return a list of build summaries. This makes the **cmdlet** faster, but returns less information by default.

Detailed information is still available via `Get-PFMultiplayerBuild`, simply use the new **-Default** parameter, as shown below.

```azurepowershell
Get-PFMultiplayerBuild -Detailed

Get-PFMultiplayerBuild "my build name" -Detailed
```

This will use the GetBuilds API to obtain the detailed configuration for your builds.

## API changes

### ListBuilds

- **ListBuilds** -> renamed **ListBuildSummaries**

### Property name changes

**CreateBuildWithManagedContainerRequest/CreateBuildWithManagedContainerResponse**:

- **StartGameCommand** -> renamed  **StartMultiplayerServerCommand**
- **RegionConfiguration** is now **RegionConfigurations** (plural) for consistency throughout **APIs** request/responses.

### GetBuilds

- Response now contains both **ContainerRunCommand** and **StartMultiplayerServerCommand**.
- **StartMultiplayerServerCommand** is for Managed builds, and **ContainerRunCommand** is for Custom builds.
- **GetBuildResponse** will return *both*, but will return null appropriately (i.e. **StartMultiplayerCommand** will be null for Custom builds and **ContainerRunCommand** will be null for Managed` builds).

## Response changes

### CreateBuildResponse

- Renamed **CreateBuildWithManagedContainerResponse** and **CreateBuildWithCustomContainerResponse**.

This separation was necessary to conform to our other APIs, as well as ensure that we differentiate between both, and are able to filter/add extra information for the different flavors of builds.

### BuildSummary

- This has been eliminated from **GetBuild**, **CreateBuildWithManagedContainerResponse**, and **CreatedBuildWithCustomContainerResponse**.
- All information will be at the *top level response objects* (**CreateBuildWithManagedContainerResponse**, **CreateBuildWithCustomContainerResponse**, **GetBuildResponse**).

- Additionally, **BuildSummary** has been changed, is only used in **ListBuildSummaries**, and will output as a list of ID and Name. The usage has changed in that developers will have to call `GetBuild` passing in a `BuildId` to get extra information. This is an optimization necessary on our end.

## Enum changes

**ContainerFlavor** has had these two enum values:

- **ManagedWindowsServerCore**
- **CustomLinux**

## August 6, 2018- Private preview release notes

APIs and PowerShell have been renamed. This is one of the last breaking changes we are making to the API before removing the "beta" label.

### API renames

- GetComputeStatus        -> GetTitleEnabledForMultiplayerServersStatus
- AllocateSessionHost     -> RequestMultiplayerServer
- GetSessionHostLogs      -> GetMultiplayerServerLogs
- GetSessionHostDetails   -> GetMultiplayerServerDetails
- ShutdownSessionHost     -> ShutdownMultiplayerServer
- ListSessionHosts        -> ListMultiplayerServers

### Parameter renames

- SessionHostId           -> ServerId
- SessionHostCountPerVm   -> MultiplayerServerCountPerVm
- SessionHostSummary      -> MultiplayerServerSummary

### PowerShell renames

- Get-PFQosServer         -> Get-PFMultiplayerQosServer
- Get-PFGameAsset         -> Get-PFMultiplayerAsset
- Add-PFGameAsset         -> Add-PFMultiplayerAsset
- Add-PFGameCertificate   -> Add-PFMultiplayerCertificate
- Get-PFGameCertificate   -> Get-PFMultiplayerCertificate
- Get-PFGameBuild         -> Get-PFMultiplayerBuild
- New-PFGameBuild         -> New-PFMultiplayerBuild
- Remove-PFGameBuild      -> Remove-PFMultiplayerBuild
- Get-PFGameSessionHost   -> Get-PFMultiplayerServer
- New-PFGameSessionHost   -> New-PFMultiplayerServer

### Changes (PowerShell Module v0.884)

- `Add-PFGameCertificate` now supports uploading certificates (PFX) that require a password.

### Changes (PowerShell Module v0.882)

- Allocating session hosts with `New-PFGameSessionHost` requires additional parameters (region in particular) as these are no longer hard coded values.
- Removing builds and other cmdlets now accept build name instead of build ID for greater convenience.
