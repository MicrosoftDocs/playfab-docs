---
title: player_set_profile_property
author: joannaleecy
description: player_set_profile_property event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_set_profile_property

This event is triggered when PlayFab makes an internal adjustment to a player profile.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Property|[PlayerProfileProperty](../data-types/playerprofileproperty.md)|Property of the profile to be set|
|TitleId|String|The ID of the title to which this player event applies.|
|Value|object|Value to set to|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
