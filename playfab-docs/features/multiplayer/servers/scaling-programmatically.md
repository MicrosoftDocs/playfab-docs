---
title: Scaling Programmatically
author: joannaleecy
description: Scaling Programmatically with the Multiplayer Servers API
ms.author: joanlee
ms.date: 03/22/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, standby, servers, scaling, multiplayer
ms.localizationpriority: medium
---

# Scaling Programmatically

## Dynamic Standby Object

The Dynamic Standby feature introduces a new object to the Multiplayer programming interface called `DynamicStandby`. The Dynamic Standby object is an optional property of the [BuildRegionParams](/rest/api/playfab/multiplayer/multiplayerserver/updatebuildregions#buildregionparams) object.

Configuring Dynamic Standby requires editing the settings properties of the Dynamic Standby object. Modifying the default values of the properties is an advanced game server feature and must be done with caution.

## Scheduled Standby Object

The Scheduled Standby feature introduces a new object to the Multiplayer programming interface called `ScheduledStandby`. The Scheduled Standby object is an optional property of the [BuildRegionParams](/rest/api/playfab/multiplayer/multiplayer-server/update-build-regions#buildregionparams) object.

Configuring Schedule Standby requires editing the settings properties of the Schedule Standby object. Modifying the default values of the properties is an advanced game server feature and must be done with caution.

## Enable Standby Scaling programmatically

You can programmatically enable Dynamic or Scheduled Standby by calling any of the following Multiplayer Server APIs:

1. Override [Update Build Regions](/rest/api/playfab/multiplayer/multiplayer-server/update-build-regions)  
   *UPSERT: An operation that inserts rows into a database table (if they do not already exist) or updates them (if they do).*
2. [Create Build with Custom Container](/rest/api/playfab/multiplayer/multiplayerserver/createbuildwithcustomcontainer)
3. [Create Build with Managed Container](/rest/api/playfab/multiplayer/multiplayer-server/create-build-with-managed-container)

To enable Dynamic or Schedule Standby programmatically, toggle the `Mode` property to ON. The `Mode` is the only required property of the Dynamic Standby or Schedule Standby Settings object. Its default value is **OFF**.
