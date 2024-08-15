---
title: "Deploy builds using PowerShell/API"
author: joannaleecy
description: "Deploy builds using PowerShell/API"
ms.author: joanlee
ms.date: 04/01/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer servers, thunderhead, api, powershell
ms.localizationpriority: medium
---

# Deploy builds using PowerShell/API

This article provides an overview on how to deploy/create builds for VMs using Windows OS in PowerShell on a Windows 10 development device.

When deploying a build using PowerShell/API, you're likely to be using a combination of using Game Manager and the APIs. Hence, the PowerShell/API commands are listed by functionality below.

If this is your first time deploying a build, we recommend deploying a build using the [Wrapper sample](wrapper-sample.md) because it comes with all the assets you need to actually deploy servers.

> [!Note]
> In order to use and view the PlayFab Multiplayer Servers, you need to enable the feature. If you are a new user, we recommend that you use the Game Manager method to enable this feature. For instructions, see [Enable the PlayFab Server feature](enable-playfab-multiplayer-servers.md).

## Get your title ID and developer secret key

* Get your PlayFab title ID
    * Log into your developer account on [PlayFab.com](https://playfab.com)
    * In Game Manager, go to **My Studios and Titles** page. Look for your game title and get the PlayFab game title ID

* Get the developer secret key for the title
    * In Game Manager, select your title > settings (gear icon)
    * Select **Title settings**, then select the **Secret Keys** tab to get the developer secret key

For more information about secret keys, see [Secret key management](../../../gamemanager/secret-key-management.md).

## Install the PlayFab MultiplayerAPI PowerShell module

1. Open Windows PowerShell as an Administrator

2. If you have previously installed [PlayFab Multiplayer PowerShell](https://github.com/PlayFab/MultiplayerPowershell) module, uninstall it with following command. This module is now deprecated.

```powershell
Uninstall-Package PlayFabMultiplayer
``` 
To help you transition to the new module, see [Mapping commands](#mapping-commands) to find the new equivalent commands. Be aware that both the commands and arguments could be different.

3. Install the new [PlayFabMultiplayer API module](https://github.com/PlayFab/MpsPowershell)

For detailed documentation about each command, see [Cmdlet documentation](https://github.com/PlayFab/MpsPowershell/tree/main/MpsPowershell/docs).

```powershell
Install-Module -Name PlayFabMultiplayerApi
```
>[!Tip]
> Before installing the module, you may need to set your execution policy by running ```Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser``` in PowerShell first. To learn more, see [PowerShell execution policies](/powershell/module/microsoft.powershell.core/about/about_execution_policies).

4. Learn more about the cmdlets in the PlayFab Multiplayer PowerShell module by running the following command. Or you can refer to the [PlayFabMultiplayerApi cmdlet reference documentation](https://github.com/PlayFab/MpsPowershell/tree/main/MpsPowershell/docs).

```powershell
Get-Command -Module PlayFabMultiplayerApi | Get-Help
```

## Obtain an EntityToken for your title

Run the following command using your title ID and associated developer key. You must run this command at the start of any session when using the PlayFabMultiplayerApi PowerShell module. 

It calls the [GetEntityToken](xref:titleid.playfabapi.com.authentication.authentication.getentitytoken) API to obtain an EntityToken and stores it in an environment variable for use in future cmdlets. 

```powershell
Set-PfTitle -TitleID "mytitleID" -SecretKey "mysecretkey"
```

## Enable multiplayer servers feature for your title

Run this cmdlet below to enable the Multiplayer Servers features. It calls the [enable multiplayer servers](xref:titleid.playfabapi.com.multiplayer.multiplayerserver.enablemultiplayerserversfortitle) API.

```powershell
Enable-PfMultiplayerServer
```

If you receive an error that says `Title must have a valid payment instrument associated with it in order to enable Multiplayer Servers`, see [Enable PlayFab Multiplayer Servers](enable-playfab-multiplayer-servers.md) using Game Manager to add your payment information.

## Upload an asset

Uploading an asset is mandatory when you're deploying a build for Windows servers. This is because your assets customize the managed Windows container image.

However, it's optional when deploying a build for Linux servers since you're able to customize the Linux container image. To learn more, see [Create Linux container images](deploying-linux-based-builds.md).

Run this command to upload an asset.

```powershell
New-PfAsset -FilePath C:\MyAsset.zip -AssetName MyAsset.zip
```

where:
* __Filepath__: Path to the local file you want to upload
* __AssetName__: Name of the asset to upload

For more details, see [New-PfAsset reference documentation](https://github.com/PlayFab/MpsPowershell/blob/main/MpsPowershell/docs/New-PfAsset.md).

## Create a build

* When creating a build for Windows servers, you need to have uploaded an asset. If not, see [Upload an asset](#upload-an-asset).
* When creating a build for Linux servers, you need to have uploaded your custom Linux container image to your PlayFab container registry. To learn more, see [Deploying Linux servers](deploying-linux-based-builds.md).

> [!IMPORTANT] 
> Make sure you use the correct values for __$vmSize__ and __$regions__ if you plan to take advantage of resources offered for [free evaluation](billing-for-thunderhead.md).

Sample code below to help deploy builds for Windows game servers.

```powershell
$vmSize = "Standard_D2as_v4"
$regions = @( @{ StandbyServers = 1; MaxServers = 1; Region = 'EastUS'; ScheduledStandbySettings = $NULL } )
$ports = @( @{ Name = 'tcp_port'; Num = 8080; Protocol = 'TCP' }, @{ Name = 'udp_port'; Num = 8081; Protocol = 'UDP' } )
$gameAssets = @( @{ FileName = 'MyAsset.zip'; MountPath = 'C:\Assets' } )

$buildResponse = New-PfBuild -BuildName ExampleBuild -ContainerFlavor ManagedWindowsServerCore -StartMultiplayerServerCommand 'C:\Assets\MyCustomServer.exe' -GameAssetReferences $gameAssets -VMSize $vmSize -MultiplayerServerCountPerVM 1 -Ports $ports -RegionConfigurations $regions

# All PlayFabMultiplayerApi cmdlets return objects, so we can pass the returned object to ConvertTo-Json for human readability.
$buildResponse | ConvertTo-Json -depth 5
```

Sample code below to help deploy builds for Linux game servers.

```powershell
$vmSize = "Standard_D2as_v4"
$ports = @( @{ Name = 'tcp_port'; Num = 8080; Protocol = 'TCP' }, @{ Name = 'udp_port'; Num = 8081; Protocol = 'UDP' } )
$regions = @( @{ 'MaxServers' = 1; 'Region' = 'AustraliaEast'; StandbyServers = 1; 'ScheduledStandbySettings' = $NULL } )
$containerImageReference = @{ ImageName = "MyLinuxContainerImage"; Tag = "0.2" }

$buildResponse = New-PfBuild -BuildName ExampleBuild -ContainerFlavor CustomLinux -ContainerImageReference $containerImageReference -VMSize $vmSize -MultiplayerServerCountPerVM 1 -Ports $ports -RegionConfigurations $regions

# All PlayFabMultiplayerApi cmdlets return objects, so we can pass the returned object to ConvertTo-Json for human readability.
$buildResponse | ConvertTo-Json -depth 5
```

> [!Tip]
> During development, shut off any unused or unhealthy regions to avoid VM core hour usage. Core hour usage begins during VM startup and continues until the VM is shut off. VMs in a region will not automatically be shut off unless the region's target standby servers reach 0, or a region is deleted. 

### Shutting down VMs
There are three ways to shut down VMs 
1. Set a region's **target standby** to 0, this will shut down VMs for this region only.
2. Delete a specific region from a build.
3. Delete the whole build, this will shut down VMs across **all regions** for this build.

## List deployed builds

To see a list of builds for your title, run the commands below.

```powershell
Get-PfBuild | ConvertTo-Json -depth 5
```

### Request a multiplayer server

Once you've created a build, one or more servers will be created after running your .exe file. These servers are now "standing by".

You can see them when you list all the servers running our build using this command.

```powershell
Get-PFMultiplayerServer -BuildId $buildResponse.data.BuildId -Region "EastUS"
```

Once we see some standby servers, let's request one for gameplay...

```powershell
$sessionId = New-Guid
$serverResponse = Request-PfMultiplayerServer -BuildId $buildResponse.data.BuildId -PreferredRegions @('EastUS') -SessionId $sessionId
```

The response to that call includes an IPv4 address and port number that clients can connect to. For WindowsRunnerCSharp.exe, it hosts a simple webserver so you can browse to the IPv4 address and port number to get a response:

```powershell
curl "http://$($serverResponse.data.Ipv4Address):$($serverResponse.data.Ports[0].Num)"
```

This is the core of PlayFab multiplayer servers: within 3 seconds of your matchmaking service calling [RequestMultiplayerServer](xref:titleid.playfabapi.com.multiplayer.multiplayerserver.requestmultiplayerserver), PlayFab will allocate a new server.

These servers come from continuously refilled, standing-by server pools you configure on a per-region and per-build basis.

## Mapping commands

Table below shows the new equivalent of the old commands. This is a quick mapping to help those who have used the previous version of the PowerShell module and need to convert their existing commands.

Make sure to read the definition of each command to get full details of the change since some of the arguments have also changed.

| MultiplayerPowershell command (Old)| MpsPowershell API module (New)|
|-----------------------------------|-------------------------------|
| Add-PFMultiplayerAsset	| New-PfAsset|
| Add-PFMultiplayerCertificate| Invoke-PfUploadCertificate |
| Enable-PFMultiplayerServer | [Enable-PfMultiplayerServer](https://github.com/PlayFab/MpsPowershell/blob/main/MpsPowershell/docs/Enable-PfMultiplayerServer.md) |
| Get-PFMultiplayerAsset | [Get-PfAssetSummary](https://github.com/PlayFab/MpsPowershell/blob/main/MpsPowershell/docs/Get-PfAssetSummary.md) |
| Get-PFMultiplayerBuild | [Get-PfBuild](https://github.com/PlayFab/MpsPowershell/blob/main/MpsPowershell/docs/Get-PfBuild.md) |
| Get-PFMultiplayerCertificate | [Get-PfCertificateSummary](https://github.com/PlayFab/MpsPowershell/blob/main/MpsPowershell/docs/Get-PfCertificateSummary.md) |
| Get-PFMultiplayerContainerImages | [Get-PfContainerImage](https://github.com/PlayFab/MpsPowershell/blob/main/MpsPowershell/docs/Get-PfContainerImage.md) |
| Get-PFMultiplayerImageTags | [Get-PfContainerImageTag](https://github.com/PlayFab/MpsPowershell/blob/main/MpsPowershell/docs/Get-PfContainerImageTag.md) |
| Get-PFMultiplayerQosServer | [Get-PfQosServer](https://github.com/PlayFab/MpsPowershell/blob/main/MpsPowershell/docs/Get-PfPartyQosServer.md) |
| Get-PFMultiplayerServer | [Get-PfMultiplayerServer](https://github.com/PlayFab/MpsPowershell/blob/main/MpsPowershell/docs/Get-PfMultiplayerServer.md) |
| Get-PFTitleEntityToken | deprecated |
| New-PFMultiplayerBuild | [New-PfBuild](https://github.com/PlayFab/MpsPowershell/blob/main/MpsPowershell/docs/New-PfBuild.md) |
| New-PFMultiplayerServer | [Request-PfMultiplayerServer](https://github.com/PlayFab/MpsPowershell/blob/main/MpsPowershell/docs/Request-PfMultiplayerServer.md) |
| Remove-PFMultiplayerAsset | [Remove-PfAsset](https://github.com/PlayFab/MpsPowershell/blob/main/MpsPowershell/docs/Remove-PfAsset.md) |
| Remove-PFMultiplayerBuild | [Remove-PfBuild](https://github.com/PlayFab/MpsPowershell/blob/main/MpsPowershell/docs/Remove-PfBuild.md) |
| Remove-PFMultiplayerCertificate | [Remove-PfCertificate](https://github.com/PlayFab/MpsPowershell/blob/main/MpsPowershell/docs/Remove-PfCertificate.md) |
| Remove-PFMultiplayerContainerImageTag | [Invoke-PfImageUntagContainer](https://github.com/PlayFab/MpsPowershell/blob/main/MpsPowershell/docs/Invoke-PfImageUntagContainer.md) |
| Set-PFTitle | [Set-PfTitle](https://github.com/PlayFab/MpsPowershell/blob/main/MpsPowershell/docs/Set-PfTitle.md) |

## See also

* [Walkthrough: Deploy builds using PowerShell/API](quickstart-for-multiplayer-servers-api-powershell.md)
* [Deploy a build using Game Manager](deploy-using-game-manager.md)
* [Create your first server](create-your-first-server.md)
* [Wrapper sample](wrapper-sample.md)
* [Samples and resources](server-samples-resources.md)
