---
title: Workaround for peer-to-peer connection
author: keithrkline
description: Describes how to share IP addresses through matchmaking
ms.author: kkline
ms.date: 03/21/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, peer-to-peer
ms.localizationpriority: medium
---

# Workaround for peer-to-peer connection

The end result of matchmaking is a Match - a collection of tickets that satisfy the rules for the queue. For titles with a dedicated server, the match ID is unique, and can be used to identify groups of players that should play together.

In the peer-to-peer case however, the title needs to pass connection information
to each other. This tutorial describes a workaround to perform this.

> [!NOTE]
> Peer-to-peer connection in matchmaking is currently not officially supported. Consider [PlayFab Party](../networking/index.md), or contact us for more information.

## Specify an IP address as an attribute

Similar to [Specifying attributes with your tickets](ticket-attributes.md), an
arbitrary value such as an IP address can be specified as an attribute. It does not need to correspond to a rule.

```json
POST https://{{TitleId}}.playfabapi.com/Match/CreateMatchmakingTicket
{
    "Creator": {
        "Entity": {
            "Id": "A8140AB9109712B",
            "Type": "title_player_account",
            "TypeString": "title_player_account"
        },
        "Attributes": {
            "DataObject": {
                "IP": "123.234.123.12"
            }
        }
    },
    "MembersToMatchWith": [],
    "GiveUpAfterSeconds": 2,
    "QueueName": "IPExampleQueue"
}
```

## Retrieving all player IPs from a Match

When calling
[GetMatch](xref:titleid.playfabapi.com.multiplayer.matchmaking.getmatch), specify the flag `ReturnMemberAttributes` as `true` to have the attributes of each ticket returned. This will include the specified IP addresses.

```json
{
    "code": 200,
    "status": "OK",
    "data": {
        "MatchId": "3d58dc0f-2eb6-4162-a2e0-1ed6ac5ea551",
        "Members": [
            {
                "TeamId": "",
                "Entity": {
                    "Id": "A8140AB9109712B",
                    "Type": "title_player_account",
                    "TypeString": "title_player_account"
                },
                "Attributes": {
                    "DataObject": {
                        "IP": "123.234.123.12"
                    }
                }
            },
            {
                "TeamId": "",
                "Entity": {
                    "Id": "562D72A5B184F612",
                    "Type": "title_player_account",
                    "TypeString": "title_player_account"
                },
                "Attributes": {
                    "DataObject": {
                        "IP": "123.234.123.12"
                    }
                }
            }
        ]
    }
}
```

> [!NOTE]
> While this can be used to exchange IPs, it does not guarantee connectivity between the clients.
