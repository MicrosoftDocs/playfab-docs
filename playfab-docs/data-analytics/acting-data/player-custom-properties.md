---
title: Player Custom Properties
author: sofiamarinv
description: Overview on Player Custom Properties
ms.author: sofiamarin
ms.date: 10/18/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, player custom properties, custom properties, segmentation, advanced segmentation, data, analytics
ms.localizationpriority: medium
---

# Player Custom Properties 

> [!NOTE]
> The Player Custom Properties feature is in private preview. We anticipate ongoing changes to it as we continue gathering feedback and optimizing for customer use.

Custom Properties are key-value data pairs that store additional information about players. These data pairs type can be string, numeric, boolean, or datetime.

Custom Properties and their values are stored with other player information, such as their display name, statistics, and tags.

> [!Note] 
> Custom properties are only supported on title_player_account entities. 

## Configuring Custom Properties

Custom Properties can be set up in different ways: 
- Through the **UpdatePlayerCustomProperties** action, which updates the player’s properties.   
- You can also remove custom properties using the **DeletePlayerCustomProperties** action.
- And you can also modify a single player’s properties via the Game Manager UI.

## Limits

Some limitations on the Custom Properties are: 
- Property names must be of type string and have a maximum length of 24 characters
- Property names are case sensitive, so for example prop and PROP are different names
- String values have a maximum length of 32 characters
- The supported numeric values are double floating point (IEEE 754 standard)
- Datetime string values must use the ISO 8601 format and all comparisons are done with respect to UTC
- There can be only 10 unique custom properties per player (It isn't required that each player has the exact same 10 property names)

## Benefits

Custom properties are powerful, they enable you to do codeless development that correlates multiple existing PlayStream events, which enable you to track state across events related to the same player.
