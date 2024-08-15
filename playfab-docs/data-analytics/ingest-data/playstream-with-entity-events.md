---
title: PlayStream with entity events
author: norie
description: Page for PlayStream V2.
ms.author: norie
ms.date: 02/06/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, automation, playstream, events
ms.localizationpriority: medium
---

# PlayStream with entity events

PlayFab has introduced the **entity event model**, a new event model that corresponds to the **entity programming model**. An [entity](../../features/data/entities/index.md) refers to any PlayFab concept that contains data. That can be a player, title, character, group, etc. 

In the classic event model, there existed different events and APIs for each type of entity. For example, when creating a new entity you'd see an event like `group_created`, `character_created`, or `player_created` depending on what type of entity was created. Under the entity event model, there's only a single event, `entity_created`, to encompass all of the above.    

 With the new entity format, we were able to simplify the amount of different APIs and events that exist. You'll continue to see classic events alongside entity events in the PlayStream monitor in order to support existing titles as we finish migrating to the new event model.    

Entity events support the following PlayFab features:

* **Batches of events** - Write multiple entity events to PlayStream at once with the [WriteEvents](/rest/api/playfab/events/play-stream-events/write-events?view=playfab-rest&preserve-view=true) API.
* **A real-time rules engine** - Set up rules that react in real time to entity events flowing through PlayStream, and trigger a variety of [actions](../acting-data/action-rules-overview.md). PlayFab supports the following actions on entity events:
  - Run custom CloudScript (including CloudScript with Azure functions)
  - Send emails
* **A real-time debugger** - See entity events appear in the [PlayStream monitor](playstream-overview.md) alongside classic events. 

> [!NOTE]
> Currently Playstream does not support creating rules for events with names longer than 40 characters.


Entity events are also supported for data and analytics features that allow you to discover pertinent information about your game:
* **PlayFab Insights** - Have the tools to examine all of your event data together, both classic and entity events.

