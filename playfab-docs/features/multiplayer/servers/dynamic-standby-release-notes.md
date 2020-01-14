---
title: Dynamic Standby Release Notes
author: TBD
description: Release notes for Dynamic Standby
ms.author: lejackso
ms.date: 01/14/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, Dynamic Standby, Multiplayer, Server
ms.localizationpriority: medium
---

# Dynamic Standby Release Notes

PlayFab’s Multiplayer Servers leverages a bank of standby servers to support immediate fulfillment of game developers’ requests for additional game servers in response to player demand. If the demand grows at a rate faster than the time necessary to acquire new servers from reserves and build new game servers, the pool of standby servers will become empty. Under this circumstance, the pool of available servers is in a “starvation” state and requests for game servers will fail until additional servers can be provisioned. An auto scaling enhancement named Dynamic Standby monitors standby server threshold levels and dynamically activates increased provisioning of game servers so that demand can be met at scale.

The Dynamic Standby feature introduces a new object to the Multiplayer programming interface called “DynamicStandby” object. The Dynamic Standby object is an optional property of the [BuildRegionParams](https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/updatebuildregions?view=playfab-rest#buildregionparams)  object.

Dynamic Standby is an advance game server feature and editing the settings from its default values should be done with caution. Configuring Dynamic Standby requires editing properties of the Dynamic Standby object. For further information, see the Dynamic Standby feature in the Multiplayer Servers section of the user documentation.
