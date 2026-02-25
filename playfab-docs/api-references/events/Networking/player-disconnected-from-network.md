---
title: player_disconnected_from_network
author: raulalbertog
description: player_disconnected_from_network event.
ms.author: raulalbertog
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_disconnected_from_network

This event is triggered when a player disconnects from a network.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|LoginIdentityProvider|String|The identity provider used for login.|
|RegionName|String|The region name associated with the relay.|
|ChatDurationInMs|uint64|The total duration of chat time in milliseconds.|
|ConnectedDurationInMs|uint64|The total duration the player was connected to the network in milliseconds.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
