---
title: player_photon_session_authenticated
author: joannaleecy
description: player_photon_session_authenticated event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_photon_session_authenticated

This event is triggered when a player connects to a Photon Cloud application and authenticates with PlayFab using Photon custom authentication.

Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|PhotonApplicationId|String|Unique identifier of the Photon Cloud application to which the player is connected|
|PhotonApplicationType|[PhotonServicesEnum](../data-types/photonservicesenum.md)|Type of Photon Cloud application to which the player is connected|
|TitleId|String|The ID of the title to which this player event applies.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
