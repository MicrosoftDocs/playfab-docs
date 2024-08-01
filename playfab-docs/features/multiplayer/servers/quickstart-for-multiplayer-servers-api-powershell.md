---
title: "Walkthrough: Deploy builds using PowerShell/API"
author: joannaleecy
description: "Walkthrough: Deploy builds using PowerShell/API"
ms.author: joanlee
ms.date: 04/01/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer servers, thunderhead, api, powershell
ms.localizationpriority: medium
---

# Walkthrough: Deploy builds using PowerShell/API

This topic describes how to deploy/create builds for Windows OS VMs in PowerShell on a Windows 10 development device based on the Windows Runner C# sample.

> [!Note]
> In order to use and view the PlayFab Multiplayer Servers, you need to enable the feature. We recommend that you use the Game Manager method to enable this feature. For instructions, see [Enable the PlayFab Server feature](enable-playfab-multiplayer-servers.md).

## Prerequisites

Make sure you have completed the following steps.

* [Configure API feature option](windows-runner-sample.md#configure-api-feature-option)
* [Server set up](windows-runner-sample.md#server-set-up).

## 1. Get your title ID and developer secret key

* Get your PlayFab title ID
    * Log into your developer account on [PlayFab.com](https://playfab.com)
    * In Game Manager, go to **My Studios and Titles** page. Look for your game title and get the PlayFab game title ID

* Get the developer secret key for the title
    * In Game Manager, select your title > settings (gear icon)
    * Select **Title settings**, then select the **Secret Keys** tab to get the developer secret key

For more information about secret keys, see [Secret key management](../../../gamemanager/secret-key-management.md)

## 2. Install the PlayFab Multiplayer PowerShell module

Open Windows Powershell as an Administrator and run the following command to install the [PlayFabMultiplayer API module](https://github.com/PlayFab/MpsPowershell). This new [PlayFabMultiplayer API module](https://github.com/PlayFab/MpsPowershell) replaces the deprecated Multiplayer PowerShell module.

If you have previously installed [PlayFab Multiplayer Powershell](https://github.com/PlayFab/MultiplayerPowershell) module, uninstall it with following command. For those transitioning to the new module, see [Mapping commands](deploy-using-powershell-api.md#mapping-commands) to find the new equivalent commands.

```powershell
Uninstall-Package PlayFabMultiplayer
``` 

Both the commands and arguments are different in this new module. For detailed documentation about each command, see [Cmdlet documentation](https://github.com/PlayFab/MpsPowershell/tree/main/MpsPowershell/docs).

```powershell
Install-Module -Name PlayFabMultiplayerApi
```

>[!Tip]
> Before installing the module, you may need to set your execution policy using ```Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser``` first. To learn more, see [PowerShell execution policies](/powershell/module/microsoft.powershell.core/about/about_execution_policies).

## 3. Obtain an EntityToken for your title

In the **PowerShell** window, run the following command using your title ID and associated developer key:

```powershell
Set-PfTitle -TitleID "mytitleID" -SecretKey "mysecretkey"
```
## 4. Upload assets

When you deploy Windows servers, you would use the managed Windows Container. All you have to do is to upload the PlayFab Multiplayer Game Server Build as an asset.

Update the value of the __FilePath__ flag with the local file location of __winrunnerSample.zip__. If you don't know where this file is, follow the instructions [here](windows-runner-sample.md#server-set-up) to get the file.

```powershell
New-PfAsset -FilePath C:\windowsRunnerCSharp.zip -AssetName windowsRunnerCSharp.zip
```
## 5. Create a build

Now that the asset is uploaded, we can create a build. Run the following commands.

The code below uses the __Standard_D2as_v4__ VM in the __EastUS__ region. Replace strings according to the VM and region you want to use.

```powershell
$vmSize = "Standard_D2as_v4"

$regions = @( @{ StandbyServers = 1; MaxServers = 1; Region = 'EastUS'; ScheduledStandbySettings = $NULL } )

$ports = @( @{ Name = 'game_port'; Num = 3600; Protocol = 'TCP' } )

$gameAssets = @( @{ FileName = 'windowsRunnerCSharp.zip'; MountPath = 'C:\Assets' } )

$buildResponse = New-PfBuild -BuildName PSTest_build -ContainerFlavor ManagedWindowsServerCore -StartMultiplayerServerCommand 'C:\Assets\WindowsRunnerCSharp.exe' -GameAssetReferences $gameAssets -VMSize $vmSize -MultiplayerServerCountPerVM 1 -Ports $ports -RegionConfigurations $regions

# All PlayFabMultiplayerApi cmdlets return objects, so we can pass the returned object to ConvertTo-Json for human readability.
$buildResponse | ConvertTo-Json -depth 5
```

## Check that your build is successful

In a few seconds, you would see the build created through the **PowerShell** or [ListBuildSummaries API](xref:titleid.playfabapi.com.multiplayer.multiplayerserver.listbuildsummariesv2).

You can also run the following command to check that the build deployed successfully.

```powershell
Get-PfBuild | ConvertTo-Json -depth 5
```

## See also

* [Walkthrough: Deploy builds using Game Manager](quickstart-for-multiplayer-servers-game-manager.md)
* [Windows Runner C# sample](windows-runner-sample.md)
* [Samples and resources](server-samples-resources.md)
