---
title: player_authenticated
author: ronnyparedes
description: player_authenticated event.
ms.author: ronnyparedes
ms.date: 02/12/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_authenticated

This event is triggered when a player account (master_player_account entity) is authenticated using a player identity from a player identity provider.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EntityTokenId|String|Unique identifier for the generated master_player_account entity token for authenticating subsequent API calls.|
|IdentityProvider|String|Name of the player identity provider used to authenticate the player identity.|
|IdentityProviderIssuedId|String|Unique ID of the player identity within the player identity provider.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
