---
title: player_identity_link_added
author: ronnyparedes
description: player_identity_link_added event.
ms.author: ronnyparedes
ms.date: 02/12/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_identity_link_added

This event is triggered when a player identity from a player identity provider is linked to a master_player_account entity. After linking, the player identity may be used to authenticate the master_player_account.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|IdentityLinkId|String|Unique identifier of the added link between the player identity and master_player_account.|
|IdentityProvider|String|Name of the player identity provider in which the linked identity exists.|
|IdentityProviderIssuedId|String|Unique identifier of the linked player identity, as assigned by the player identity provider.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
