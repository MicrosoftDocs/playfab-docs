---
title: unity_client_initialization_completed
author: raulalbertog
description: unity_client_initialization_completed event.
ms.author: raulalbertog
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# unity_client_initialization_completed

This event is triggered when Unity client initialization is completed.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|ClientInstanceId|String|A unique identifier for this game session.|
|PartyVersion|String|The version of the Party native library.|
|PartyUnityVersion|String|The version of the Party Unity SDK.|
|UnityVersion|String|The version of the Unity engine.|
|OSName|String|The name of the operating system.|
|DeviceMake|String|The device manufacturer name.|
|DeviceModel|String|The device model name.|
|Platform|String|The Unity runtime platform.|
|AppName|String|The application product name.|
|AppVersion|String|The application version.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
