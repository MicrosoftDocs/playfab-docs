---
title: player_ad_campaign_attribution
author: joannaleecy
description: player_ad_campaign_attribution event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_ad_campaign_attribution

This event is triggered by an attribution tracking Add-on when a player is matched to a paid acquisition campaign.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|CampaignId|String|The ID of the campaign, as passed in by the attribution provider.|
|TitleId|String|The ID of the title to which this player event applies.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
