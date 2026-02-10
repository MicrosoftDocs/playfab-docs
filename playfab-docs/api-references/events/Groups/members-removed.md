---
title: members_removed
author: joannaleecy
description: members_removed event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# members_removed

This event is triggered when members are removed from a group role.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Members|[EntityKey](../data-types/entitykey.md)[]|Entity keys of all members that were removed from the role.|
|RoleId|String|Id of role members were removed from.|
|RoleName|String|Name of role members were removed from.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
