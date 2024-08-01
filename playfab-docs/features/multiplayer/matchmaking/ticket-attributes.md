---
title: Specifying attributes with your tickets
author: keithrkline
description: Tutorial on how to specify attributes in matchmaking tickets
ms.author: kkline
ms.date: 03/15/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, matchmaking, match, tutorial
ms.localizationpriority: medium
---

# Specifying attributes with your tickets

Rules determine which tickets are matched, based on the attributes specified by players. These attributes can be specified in two ways, either:

1. Within the create ticket request
2. In the player's entity

This tutorial describes how to specify those attributes.

## Specifying within the create ticket request

For rules configured with the attribute type "User", attributes are specified in
a `CreateMatchmakingTicket` request, alongside the player entity inside of an attributes `DataObject`.

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
                "mu": 16.0,
                "sigma": 1.8,
                "nestExample": {
                    "exp": 1500
                }
            }
        }
    },
    "MembersToMatchWith": [],
    "GiveUpAfterSeconds": 2,
    "QueueName": "SkillRuleQueue"
}
```

Below is an example queue configuration with a `DifferenceRule`. This rule
contains an attribute path and source that will pick up the value 16.0,
specified by the `CreateMatchmakingTicket` request above.

```json
"MatchmakingQueue": {
    "Name": "SkillRuleQueue",
    "MinMatchSize": 2,
    "MaxMatchSize": 2,
    "ServerAllocationEnabled": false,
    "Rules": [
        {
            "Type": "DifferenceRule",
            "Difference": 3,
            "MergeFunction": "Average",
            "Attribute": {
                "Path": "mu",
                "Source": "User"
            },
            "AttributeNotSpecifiedBehavior": "MatchAny",
            "Weight": 1,
            "Name": "SkillRule",
            "SecondsUntilOptional": 10
        }
    ]
}
```

> [!NOTE]  
> Rules can navigate through the `DataObject` with a JSON Path. Replacing the Path field with "nestExample.exp" would cause the rule to use the value 1500 for the ticket created above.

## Specifying through player entities

For rules with the attribute type "Player Entity", attributes are specified through a separate call to the `SetObjects` API.

This allows data to be stored for a user, rather than the title needing to specify it on each create ticket call.
This may make more sense for values that persist for a user, or that users cannot be trusted to submit. An example of this `SetObjects` call is shown below.

```json
POST https://{{TitleID}}.playfabapi.com/Object/SetObjects
{
    "Objects": [
        {
            "ObjectName": "playerSkill",
            "DataObject": {
                "skillDetail": {
                    "mu": 16.0,
                    "sigma": 2.0
                }
            }
        }
    ],
    "Entity": {
        "Id": "A8140AB9109712B",
        "Type": "title_player_account",
        "TypeString": "title_player_account"
    }
}
```

A queue with the following configuration would retrieve the value 16.0 for use in its `DifferenceRule` rule, when a ticket is created with this player.

> [!NOTE]
> In the `Path` field, the first item after the root is the `ObjectName`, allowing you to choose which stored object to reference.

```json
"MatchmakingQueue": {
    "Name": "PlayerEntityRuleQueue",
    "MinMatchSize": 2,
    "MaxMatchSize": 2,
    "ServerAllocationEnabled": false,
    "Rules": [
        {
            "Type": "DifferenceRule",
            "Difference": 1,
            "MergeFunction": "Average",
            "Attribute": {
                "Path": "$.playerSkill.skillDetail.mu",
                "Source": "PlayerEntity"
            },
            "AttributeNotSpecifiedBehavior": "MatchAny",
            "Weight": 1,
            "Name": "SkillRule",
            "SecondsUntilOptional": 10
        }
    ]
}
```

## Special formats

Most rules use attributes that are either strings or numeric, and are simply those values in JSON format. Rules that require more complex attributes to be passed in are listed below.

### Region Selection rule

A Region Selection rule requires an array of latency measurements with the specified schema. The following example is the expected attribute format for a region selection rule, shown alongside the two attributes used in the `CreateMatchmakingTicket` request example for comparison.

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
                "mu": 16.0,
                "sigma": 1.8,
                "Latencies": [
                    {
                        "region": "EastUs",
                        "latency": 150
                    },
                    {
                        "region": "WestUs",
                        "latency": 400
                    }
                ]
            }
        }
    },
    "MembersToMatchWith": [],
    "GiveUpAfterSeconds": 2,
    "QueueName": "ServerEnabledQueue"
}
```

In this example, `Latencies` must match the field referenced by the `Path` field in the rule. An example of a rule which would use the `Latencies` field is included in the queue below.

```json
"MatchmakingQueue": {
    "Name": "ServerEnabledQueue",
    "MinMatchSize": 2,
    "MaxMatchSize": 2,
    "ServerAllocationEnabled": true,
    "BuildId": "88b3e315-829c-4b6d-9872-74f427ad5331",
    "Rules": [
        {
            "Type": "RegionSelectionRule",
            "MaxLatency": 1000,
            "Path": "Latencies",
            "Weight": 1,
            "Name": "RegionRule",
            "SecondsUntilOptional": 60
        }
    ]
}
```

> [!NOTE]
> When using the region selection rule for a queue that has server allocation enabled, the regions must be valid Azure Regions. You can find the list of valid Azure Regions [here](../../../api-references/events/data-types/azureregion.md).
