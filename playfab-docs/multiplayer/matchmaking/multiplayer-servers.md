---
title: Integrating with PlayFab Multiplayer Servers
author: keithrkline
description: Tutorial on how to allocate multiplayer servers in your queue automatically
ms.author: kkline
ms.date: 03/15/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, matchmaking, match, tutorial
ms.localizationpriority: medium
---

# Integrating with PlayFab Multiplayer Servers

Matchmaking includes an option that can automatically create a game server for the resulting match. The allocated server runs a build, which is configured in the queue's config. On startup, the server is passed in the members of the match as the list of initial players.

A matchmaking queue is tied to a single multiplayer server build or to a build alias. 

## Requirements to use direct integration of matchmaking and servers

In order to allocate a multiplayer server from matchmaking, you first need to configure a build and deploy it. You can optionally create a build alias and use that as well. Build aliases are preferred as they allow more flexibility for your title usage. Follow the link we have provided here to get more information about [Multiplayer Server builds](../servers/deploying-playfab-multiplayer-server-builds.md) and [Multiplayer Server build alias](../servers/allocating-with-build-alias.md)

Matchmaking also needs a region selection rule to be added to the queue, so that matches can be allocated in the optimal region for the build. The latency measurements passed into the region selection rule should match the regions where the build is active. For more information on how to pass attributes to a region selection rule, see [Region selection rule](ticket-attributes.md#region-selection-rule).

## Activating server allocation for the queue

In order to enable server allocation for a queue, you need to enable the checkbox for **Enable server allocation** on the queue config page. Once you've enabled that, choose either **Build alias** or **Build Id**. Choose the correct value from the drop-down to be used by the queue. Once you enable the feature, matchmaking attempts to allocate a server for all the matches created within the queue.

The following example is what the config for a queue with multiplayer server integration should
look like using a Build Id.

```json
"MatchmakingQueue": {
    "Name": "ServerEnabledQueue",
    "MinMatchSize": 2,
    "MaxMatchSize": 2,
    "ServerAllocationEnabled": true,
    "BuildId": "88b3e315-829c-4b6d-9872-74f427ad5331",
	"RegionSelectionRule": {
		"MaxLatency": 1000,
		"Path": "Latencies",
		"Weight": 1.0,
		"Name": "RegionSelectionRule"
	}
}
```
Here's the same example with a build alias used.

```json
"MatchmakingQueue": {
    "Name": "ServerEnabledQueue",
    "MinMatchSize": 2,
    "MaxMatchSize": 2,
    "ServerAllocationEnabled": true,
    "BuildAliasParams": {
        "AliasId": "d14e2ac7-ea51-47aa-a7ba-cc427ab74f9s"
    },
	"RegionSelectionRule": {
		"MaxLatency": 1000,
		"Path": "Latencies",
		"Weight": 1.0,
		"Name": "RegionSelectionRule"
	}
}
```

The flow of calls to matchmaking remains the same with the server allocation enabled. Once matchmaking allocates a server for the match, the resulting server details can be read from the Match object itself by calling
[GetMatch](xref:titleid.playfabapi.com.multiplayer.matchmaking.getmatch).

A sample response is provided below for a `GetMatch` call for a queue with server allocation
enabled.

```json
{
    "MatchId": "7c36330d-46b5-443f-8d8f-10390bce09d5",
    "Members": [{
        "TeamId": "",
        "Entity": {
            "Id": "67282A13A1A58910",
            "Type": "title_player_account",
            "TypeString": "title_player_account"
        },
        "Attributes": {
            "DataObject": null,
            "EscapedDataObject": "{\"StringEqualityRulePath\":\"0bc42969-76b1-4dcb-871d-d6e19cee741b\"}"
        }
    },
    {
        "TeamId": "",
        "Entity": {
            "Id": "6DB2B17FD21CC230",
            "Type": "title_player_account",
            "TypeString": "title_player_account"
        },
        "Attributes": {
            "DataObject": null,
            "EscapedDataObject": "{\"StringEqualityRulePath\":\"0bc42969-76b1-4dcb-871d-d6e19cee741b\"}"
        }
    }],
    "RegionPreferences": ["WestUs", " EastUs"],
    "ServerDetails": {
        "IPV4Address": "40.76.31.170",
        "Ports": [{
            "Name": "game_port",
            "Num": 30003
        }]
    }
}
```

The clients can use the IP and port from the server details section of the response to connect to the server. For further information on how to connect clients to multiplayer servers, refer to [Connecting clients to
servers](../servers/connecting-clients-to-game-servers.md)

> [!NOTE]
> When a region of your build runs out of capacity, matchmaking is not be able to allocate matches for the queue in that region. Matchmaking will keep retrying the allocation until the ticket expires. To increase multiplayer capacity, refer to [Accessing increased core limits and additional Azure regions](../servers/identifying-and-increasing-core-limits.md)

## Information passed to the game server

Here is the list of information that matchmaking passes to the server.

- **SessionId** - The `SessionId` for the server is equal to the MatchId for the
  match.
- **InitialPlayers** - This value is set to the list of members in the match. The
  list of players can be read in the game by using the
  [GSDK](../servers/integrating-game-servers-with-gsdk.md).
- **PreferredRegions** - This field is set to the `RegionPreferences` field from the
  match. The game server service chooses an appropriate region for the
  server from this list.

Matchmaking does not pass any ticket attributes to the game server. If the game
needs to access any ticket attributes on the server, it can do so by calling
[GetMatch](xref:titleid.playfabapi.com.multiplayer.matchmaking.getmatch) with
the `ReturnMemberAttributes` header to `true`.

> [!NOTE]
> We recently enabled the passing of queue name during server allocation. This feature is in preview and you can read more about it [here](https://github.com/PlayFab/MpsSamples/blob/main/MatchmakeSample/matchMakingAndMps.md).
