---
title: members_added
author: joannaleecy
description: members_added event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# members_added

This event is triggered when members are added to a group role.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Members|[EntityKey](../data-types/entitykey.md)[]|Entity keys of all members that were added to the role.|
|RoleId|String|Id of role members were added to.|
|RoleName|String|Name of role members were added to.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
