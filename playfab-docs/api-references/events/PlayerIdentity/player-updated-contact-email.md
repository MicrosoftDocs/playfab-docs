---
title: player_updated_contact_email
author: joannaleecy
description: player_updated_contact_email event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_updated_contact_email

This event is triggered when a player updates a contact email on their profile.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EmailName|String|The name of the contact email that was updated or added in the player's profile.|
|NewEmailAddress|String|The contact email updated or added in the player's profile.|
|PreviousEmailAddress|String|The previous contact email updated in the player's profile.|
|TitleId|String|The ID of the title to which this player event applies.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
