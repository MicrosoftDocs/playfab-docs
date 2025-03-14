---
title: Diagnosing builds with the server map view
author: chpalm
description: Describes how to diagnose server availability issues using the PlayFab multiplayer server mapview.
ms.author: chpalm
ms.date: 08/23/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer servers, deploy, thunderhead, builds, availability, map, mapview
ms.localizationpriority: medium
---

# Diagnosing builds with the server mapview

For deployed builds, PlayFab offers a mapview to help diagnose server availability issues.

To navigate to it, go to the multiplayer section of Game Manager, then select the **Servers 2.0** page. The map view can be found under the **Region Map** tab.

## Using the map
When the mapview opens, it displays a world view of all regions PlayFab offers for Multiplayer Servers. The map can be zoomed to a continent level or region level using the two dropdown lists above & to the right of the map.

## Regions
The diagnostic data presented represents the function of all builds in a given title and is separated into regions. (The data for West US is entirely separate from East US, West Europe, etc.) Furthermore, this data is split into two metrics: **size**, the number of currently active servers in a region compared to that region's maximum (determined by the quota); and **health**, the allocation success percentage for that region's servers.

A healthy region is indicated by a green pushpin, an unhealthy region has a red pushpin, and an unused region (without any servers allocated to it) has a hollow gray pushpin.
