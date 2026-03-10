---
title: unreal_client_initialization_completed
author: raulalbertog
description: unreal_client_initialization_completed event.
ms.author: raulalbertog
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# unreal_client_initialization_completed

This event is triggered when Unreal client initialization is completed.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|ClientInstanceId|String|A unique identifier for this game session.|
|PartyVersion|String|The version of the Party native library.|
|UnrealEngineVersion|String|The version of the Unreal Engine.|
|PlatformSDKVersion|String|The version of the platform SDK.|
|OSSPlayFabVersion|String|The version of the OnlineSubsystemPlayFab plugin.|
|TitleID|String|The PlayFab title ID.|
|OSName|String|The name of the operating system.|
|OSVersion|String|The version of the operating system.|
|DeviceMake|String|The device manufacturer name.|
|DeviceModel|String|The device model name.|
|PlatformName|String|The name of the platform.|
|AppName|String|The application name.|
|AppVersion|String|The application version.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
