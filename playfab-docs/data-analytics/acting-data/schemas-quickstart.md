---
title: Schemas quickstart
author: joannaleecy
description: Gets you started with schemas.
ms.author: joanlee
ms.date: 07/23/2019    
ms.topic: article
ms.service: azure-playfab
keywords: playfab, insights, schemas
ms.localizationpriority: medium
---

# Schemas quickstart

> [!NOTE]
> The Schemas Features are in public preview. We anticipate ongoing changes to it as we continue gathering feedback and optimizing for customer use.

## Event Data

Event Data arrives in Insights through one of several pathways:

- Many API calls log events which are automatically written to PlayFab Insights. For example, the player_logged_in event is generated each time a log in API call is made.

- The WriteEvents API allows developers to send descriptive events.

- The WriteEvents.

Each of these events lands in a single table called [events.all](schemas-events-all.md).

## Processed Data

> [!NOTE]
> No processed data sets are available in PlayFab Insights at this stage of our Public Preview. Please check back over time as new features become available.

Processed data is copied into your title's database on a scheduled basis as transforms occur. Examples include the Trends table, which is calculated nightly in order to power the Trends feature on Game Manager. This data is copied to your Insights database for to enable custom analysis. Other planned data sets include the Player Profile state table.
