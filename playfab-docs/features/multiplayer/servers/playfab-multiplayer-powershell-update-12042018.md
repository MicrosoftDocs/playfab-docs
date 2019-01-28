---
title: PlayFab Multiplayer PowerShell Update - December 4, 2018
author: v-thopra
description: Describes the changes made in the 12/04/2018 PlayFab Multiplayer PowerShell Update.
ms.author: v-thopra
ms.date: 01/17/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer servers, thunderhead, powershell
ms.localizationpriority: medium
---

# PlayFab multiplayer PowerShell update - December 4, 2018

The PlayFab Multiplayer module (v0.920+) has a slightly different API signature for **New-PFMultiplayerBuild** that has fewer defaults (but allows for greater customization). Usage of the updated **cmdlet** is below, and the [Quickstart for multiplayer servers (API/PowerShell)](quickstart-for-multiplayer-servers-api-powershell.md) has been updated.

This updated module is implemented in **C#** (as opposed to being a **PowerShell** advanced function). This will facilitate improved reliability and capability of PlayFab **PowerShell** modules.

The previous **PowerShell** module (**v0.919**) will continue to function an can be be accessed by running:

```powershell
Install-Module -Name PlayFabMultiplayer -MaximumVersion 0.919
```

## Previous module (v0.919)

```powershell
$VMSelection = [PlayFab.MultiplayerModels.AzureVMSize]::Standard_D2_v2 

$Ports = New-object PlayFab.MultiplayerModels.Port 
$Ports.Name = "game_port" 
$Ports.Num = 3600 
$Ports.Protocol = [PlayFab.MultiplayerModels.ProtocolType]::TCP


New-PFMultiplayerBuild -BuildName "PowerShellTest" -AssetFileName "winrunnerSample.zip" -AssetMountPath "C:\Assets\" -StartMultiplayerServerCommand "C:\Assets\WindowsRunnerCSharp.exe" -MappedPorts $Ports -VMSize $VMSelection
```

## New module (v0.920)

```powershell
$VMSelection = [PlayFab.MultiplayerModels.AzureVMSize]::Standard_D2_v2 

$Ports = New-object PlayFab.MultiplayerModels.Port 
$Ports.Name = "game_port" 
$Ports.Num = 3600 
$Ports.Protocol = [PlayFab.MultiplayerModels.ProtocolType]::TCP

$Asset = NEW-OBJECT PlayFab.MultiplayerModels.AssetReferenceParams
$Asset.FileName = "winrunnerSample2.zip"
$Asset.MountPath = "C:\Assets\" 

$Regions = NEW-OBJECT PlayFab.MultiplayerModels.BuildRegionParams
$Regions.MaxServers = 10
$Regions.Region = [PlayFab.MultiplayerModels.AzureRegion]::EastUs
$Regions.StandbyServers = 2

New-PFMultiplayerBuild -BuildName "PSTest_built"  -StartMultiplayerServerCommand "C:\Assets\WindowsRunnerCSharp.exe" -Ports $Ports -VMSize $VMSelection -AssetReferences $Asset -MultiplayerServerCountPerVm 1 -RegionConfiguration $Regions
```