---
title: Using Custom Tag to Customize Your Events
author: xmcai2016
description: Learn about using custom tags to customize your events. Custom tags are a collection of key-value-pairs that studios can optionally include with an API request.
ms.author: kevinasg
ms.date: 01/11/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, automation, custom, tags, playstream, events
ms.localizationpriority: medium
---

# Using Custom Tags with PlayStream Events

Custom Tags are a collection of key-value-pairs that studios can optionally include with every API request. They are useful to  enrich the standard PlayStream events with more studio specific metadata (e.g. build number, external trace identifiers, etc.). 

Custom Tags extend the ways in which you can use PlayStream events. The basic PlayStream schema is fixed and lacks extensibility but allowed us to build common metrics and analytics. The fixed nature of the schema limited game studios' ability to customize their data in an efficient and economic manner, as well as their ability to collect specific data points. Custom Tags provide a way to extend the schema to allow greater flexibility and functionality.

## What can you do with Custom Tags?
There are many things you can accomplish using Custom Tags. Here are some suggestions, but feel free to be more creative when using them.
### Automation
PlayStream metadata can act as criteria that trigger certain events. When a task needs to be accomplished, a PlayFab customer can set up a rule to say “if [Custom Tags] satisfies xyz requirement, then fire action A.” 
 
You can integrate CloudScript with Custom Tags to achieve automation. CloudScript [Actions and Rules](../acting-data/action-rules-overview.md) allow you to fire off events automatically based on certain criteria.  

For example, if your game studio is investing in performance marketing for your game, and you are running a variety of different marketing campaigns to acquire new players, you can now track the marketing campaign that acquired a player and add that campaign ID to all PlayStream events. Then you can use that campaign ID to automate processes. For example, if your ad promised “1,000 free gold coins for signing up” then send the “new player” event and use marketing campaign to decide what incentive to give the player. E.g., ‘if marketing campaign = ‘FREE_GOLD_COINS’ then give player 1,000 gold coins.


### Telemetry
PlayStream metadata can assist with data collection and analysis. For example, you can send Custom Tags as part of your PlayStream event data from non-PlayFab services and be able to keep track of it as it flows through the data pipelines.
If you already have your own analytics system (e.g. based on some identifier), you can easily integrate and merge new data by passing that identifier in Custom Tags as part of your PlayStream events.

You can include campaign IDs or other analytical identifiers to analyze revenue, determining which campaign generated the highest new player acquisition, revenue stream, or customer value. 
 
## Data flow
Once Custom Tags are received from API request, the data becomes part of the PlaySteam event, which then flows through the PlaySteam pipelines to be stored in Kusto, PlayFab's backend data warehouse.

## Limitations 
- Custom Tags have the following restrictions:
   - No more than 10 key value pairs
   - Each key string cannot be more than 64 utf8 chars
   - Each value string cannot be more than 128 utf8 chars
   - Only supported with API calls (i.e. not supported by the Game Manager UI)

## Getting Started

The following sample request show you how add Custom Tags to your JSON request.
The `CustomTags` follow the relevant PlayStream events as they flow through the data pipelines and you are able to access this data later for actionable and analytical purposes.
### Sample Request
``` json
POST https://titleId.playfabapi.com/Server/WritePlayerEvent
{
  "PlayFabId": "{{PlayFabId}}",
  "EventName": "player_defeated_enemy",
  "Timestamp": "2016-03-07T00:00:00Z",
  "Body": {
    "Enemy": "guardian",
    "Damage": 5,
    "Coordinates": {
      "X": 123.4,
      "Y": 543.2
    }
  },
  "CustomTags": {
    "correlation_id": "123abc",
    "build_number": "1.0.0.0",
    "platform": "iOS"
  }
}
```
### Sample Response
Adding Custom Tags does not alter the response you receive from the call to the endpoint. The response after you add the `CustomTag node` is identical to the one you receive when the node is not present.