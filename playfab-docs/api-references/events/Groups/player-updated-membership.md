---
title: player_updated_membership
author: joannaleecy
description: player_updated_membership event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_updated_membership

This event is triggered when a player's membership is updated.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|MembershipId|String|The unique identifier for the membership.|
|MembershipName|String|The name of the membership.|
|MembershipValue|[PlayerMemberships](../data-types/playermemberships.md)|The current membership value after the update.|
|PreviousMembershipValue|[PlayerMemberships](../data-types/playermemberships.md)|The previous membership value before the update.|
|SetViaOverride|Boolean|Whether the membership was set via an override.|
|TitleId|String|The ID of the title to which this player event applies.|
|UpdatedSubscription|[Subscriptions](../data-types/subscriptions.md)|The subscription that was updated.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
