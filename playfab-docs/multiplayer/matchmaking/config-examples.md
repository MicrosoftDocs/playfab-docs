---
title: Matchmaking scenario and configuration examples
author: keithrkline
description: Describes examples for common Matchmaking Configuration
ms.author: kkline
ms.date: 03/15/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, matchmaking, match, config
ms.localizationpriority: medium
---

# Matchmaking scenario and configuration examples

## Overview

The system of queues and rules provides the flexibility to handle a large number of scenarios. Below are examples of some of the more common matchmaking use cases, and their associated queues. Each of these can be submitted directly via PlayFab APIs. <!--the [Matchmaking Admin API](xref:titleid.playfabapi.com.multiplayer.matchmakingadmin).--> These options can also be set via the Game Manager UI.

## My first queue, or "quick match"

Every title should begin with this simple queue to work out their basic flows. This queue matches two players together, and contains one optional rule that requires players to pass in the same build string in order to match. If no build is specified, the player may match with other players in this queue, regardless of build.

```json
"MatchmakingQueue": {
    "Name": "MyFirstQueue",
    "MinMatchSize": 2,
    "MaxMatchSize": 2,
    "ServerAllocationEnabled": false,
    "Rules": [
        {
            "Type": "StringEqualityRule",
            "Attribute": {
                "Path": "Build",
                "Source": "User"
            },
            "AttributeNotSpecifiedBehavior": "MatchAny",
            "Weight": 1,
            "Name": "BuildVersionRule"
        }
    ]
}
```

## Multiple game modes

Titles often have different ways to play games. If these players should never match with each other, placing them in separate queues optimizes performance.

```json
{
    "MatchmakingQueue": {
        "Name": "FreeForAllQueue",
        "MinMatchSize": 4,
        "MaxMatchSize": 4,
        "ServerAllocationEnabled": false,
        "Rules": [
        ]
    }
}
```

```json
{
    "MatchmakingQueue": {
        "Name": "CaptureTheFlagQueue",
        "MinMatchSize": 4,
        "MaxMatchSize": 4,
        "ServerAllocationEnabled": false,
        "Rules": [
        ]
    }
}
```

## Cross game mode search

If players are intended to match with others across game modes, use a single queue and create a Set Intersection rule. Players can specify multiple game modes, and the rule will restrict matches to ones where all players contain at least one common game mode.

> [!NOTE]  
> The number of players required to play must be the same across modes for this to function correctly.

```json
{
    "MatchmakingQueue": {
        "Name": "MultiGameModeSearchQueue",
        "MinMatchSize": 4,
        "MaxMatchSize": 4,
        "ServerAllocationEnabled": false,
        "Rules": [
        {
                "Type": "SetIntersectionRule",
                "MinIntersectionSize": 1,
                "Attribute": {
                    "Path": "GameMode",
                    "Source": "User"
                },
                "AttributeNotSpecifiedBehavior": "MatchAny",
                "Weight": 1,
                "Name": "GameModeRule"
            }
        ]
    }
}
```

## Skill based free-for-all game, with expansion

A very common scenario is attempting to match players together based on *skill*. In this example, the queue will require players' skill attributes to be within 0.2, with these attributes increasing over time to 0.5. For tickets waiting for more than 30 seconds, any skill difference is allowed.

The values for this example are chosen assuming the ranges of available skills are between 0 and 1. These should be adjusted to fit the range of values your title uses to track the skills of its players, as well as how much emphasis is placed on skill over the speed of a match.

In addition, the rule becoming optional at 30 seconds is intended for games where it is better to play a game with unbalanced skills than to not play at all. For games where an unbalanced game is entirely a negative experience, `SecondsUntilOptional` may be adjusted. If removed entirely, it causes the rule to remain active indefinitely.

```json
"MatchmakingQueue": {
    "Name": "SkillBasedFreeForAllQueue",
    "MinMatchSize": 4,
    "MaxMatchSize": 4,
    "ServerAllocationEnabled": false,
    "Rules": [
        {
            "Type": "DifferenceRule",
            "Difference": 0.2,
            "MergeFunction": "Average",
            "DefaultAttributeValue": 0.5,
            "Expansion": {
                "Delta": 0.1,
                "Limit": 0.5,
                "Type": "Linear",
                "SecondsBetweenExpansions": 5
            },
            "Attribute": {
                "Path": "Skill",
                "Source": "User"
            },
            "AttributeNotSpecifiedBehavior": "UseDefault",
            "Weight": 1,
            "Name": "SkillRule",
            "SecondsUntilOptional": 30
        }
    ]
}
```

## Customizing expansions

Expansions can be customized to use arbitrary values in each time interval. For instance, you may want the allowed skill to grow slowly to start, and later grow increasingly quickly over time.

```json
"MatchmakingQueue": {
    "Name": "SkillBasedFreeForAllCustomExpansionQueue",
    "MinMatchSize": 4,
    "MaxMatchSize": 4,
    "ServerAllocationEnabled": false,
    "Rules": [
        {
            "Type": "DifferenceRule",
            "Difference": 0.2,
            "MergeFunction": "Average",
            "DefaultAttributeValue": 0.5,
            "Expansion": {
                "DifferenceOverrides": [
                    0.025,
                    0.05,
                    0.1,
                    0.2,
                    0.3,
                    0.5
                ],
                "Type": "Custom",
                "SecondsBetweenExpansions": 5
            },
            "Attribute": {
                "Path": "Skill",
                "Source": "User"
            },
            "AttributeNotSpecifiedBehavior": "UseDefault",
            "Weight": 1,
            "Name": "SkillRule",
            "SecondsUntilOptional": 30
        }
    ]
}
```

## Expansion of number of players over time

Some titles prefer having a full match to begin with, but over time may be satisfied with fewer and fewer people. One such example is a Battle Royale style game, where it is preferred to start with as many as 50 players, but is satisfied with fewer after some time.

As `MinMatchSize` and `MaxMatchSize` do not contain an expansion, a `MatchTotalRule` can be used to modify the number of players required for a match. Each player specifies a value of 1 for the associated attribute, and the rule sums these together to enforce a requirement on the number of players in a match that changes over time.

> [!NOTE]  
> Note that if a `MaxOverrides` or `MinOverrides` array is not specified, the rule's original `Max` or `Min` value will be used in its place.

```json
"MatchmakingQueue": {
    "Name": "PlayerExpansionOverTime",
    "MinMatchSize": 8,
    "MaxMatchSize": 50,
    "ServerAllocationEnabled": false,
    "Rules": [
        {
            "Type": "MatchTotalRule",
            "Attribute": {
                "Path": "PlayerCount",
                "Source": "User"
            },
            "Min": 8,
            "Max": 50,
            "Weight": 1,
            "Expansion": {
                "MinOverrides": [
                    50,
                    45,
                    40,
                    35,
                    25,
                    16,
                    8
                ],
                "Type": "Custom",
                "SecondsBetweenExpansions": 10
            },
            "Name": "PlayersRequiredRule",
            "SecondsUntilOptional": 60
        }
    ],
}
```

## Standard 4v4 style skill based

PlayFab Matchmaking supports team-oriented matches. By specifying teams, players which are submitted together in the same ticket will all be allocated into one team, and not be forced to play against each other.

PlayFab Matchmaking also supports various team rules to help ensure teams are balanced. The example shown below is for a 4v4 match, and ensures the skills are balanced across them.

```json
"MatchmakingQueue": {
    "Name": "Standard4v4TeamsQueue",
    "MinMatchSize": 8,
    "MaxMatchSize": 8,
    "ServerAllocationEnabled": false,
    "Teams": [
        {
            "Name": "Red",
            "MinTeamSize": 4,
            "MaxTeamSize": 4
        },
        {
            "Name": "Blue",
            "MinTeamSize": 4,
            "MaxTeamSize": 4
        }
    ],
    "Rules": [
        {
            "Type": "TeamDifferenceRule",
            "Attribute": {
                "Path": "Skill",
                "Source": "User"
            },
            "Difference": 0.2,
            "DefaultAttributeValue": 0.5,
            "Expansion": {
                "Delta": 0.1,
                "Limit": 0.5,
                "Type": "Linear",
                "SecondsBetweenExpansions": 5
            },
            "Name": "TeamSkillRule",
            "SecondsUntilOptional": 30
        }
    ]
}
```

## Multiplayer servers

A queue can automatically feed into PlayFab's multiplayer servers feature, allocating a server and feeding it a list of matched players. This queue provides the smallest example of such a config, which is the `ServerAllocationEnabled` flag, along with the `BuildId` representing what build of the server should be started.

When the `ServerAllocationEnabled` flag is set to `true`, a `RegionSelectionRule` is also required to indicate where a server should be allocated for each match.

```json
"MatchmakingQueue": {
    "Name": "MultiplayerServersQueue",
    "MinMatchSize": 24,
    "MaxMatchSize": 24,
    "ServerAllocationEnabled": true,
    "BuildId": "6a4d2760-4295-417e-b149-0a12e3570d94",
    "Rules": [
        {
            "Type": "RegionSelectionRule",
            "MaxLatency": 200,
            "Path": "Latency",
            "Weight": 1,
            "Name": "RegionSelectionRule"
        }
    ]
}
```

## Big Team Battle (12 vs 12)

Larger team games may have additional requirements. In this example, the queue is configured to create a multiplayer server, which is often required to manage games with this many players. This is similar to the example above.

In addition to skill, another Team Rule is added to encourage team similarity--only one large team is allowed on each side, preventing a common situation of a Premade team being matched against a large set of random players.

```json
"MatchmakingQueue": {
    "Name": "LargeTeamsQueue",
    "MinMatchSize": 24,
    "MaxMatchSize": 24,
    "ServerAllocationEnabled": true,
    "BuildId": "6a4d2760-4295-417e-b149-0a12e3570d94",
    "Teams": [
        {
            "Name": "Red",
            "MinTeamSize": 12,
            "MaxTeamSize": 12
        },
        {
            "Name": "Blue",
            "MinTeamSize": 12,
            "MaxTeamSize": 12
        }
    ],
    "Rules": [
        {
            "Type": "TeamTicketSizeSimilarityRule",
            "Name": "PreventLargePremadeVersusRandomsRule",
            "SecondsUntilOptional": 20
        },
        {
            "Type": "TeamDifferenceRule",
            "Attribute": {
                "Path": "Skill",
                "Source": "User"
            },
            "Difference": 0.1,
            "DefaultAttributeValue": 0.5,
            "Expansion": {
                "Delta": 0.1,
                "Limit": 0.5,
                "Type": "Linear",
                "SecondsBetweenExpansions": 5
            },
            "Name": "TeamSkillRule",
            "SecondsUntilOptional": 30
        },
        {
            "Type": "RegionSelectionRule",
            "MaxLatency": 200,
            "Path": "Latency",
            "Weight": 1,
            "Name": "RegionSelectionRule"
        }
    ]
}
```

## Battle Royale

Battle Royale games place many people into an arena. In this example, the game is set up with teams of four. Currently there is a limit of 32 players allowed in a team scenario such as this one - This limitation will be improved in the future.

This example also contains multiplayer server setup information for dedicated servers, which is often necessary for games with large numbers of players. This is similar to the example shown above.

```json
    "MatchmakingQueue": {
        "Name": "BattleRoyaleStyleQueueWithTeams",
        "MinMatchSize": 32,
        "MaxMatchSize": 32,
        "ServerAllocationEnabled": true,
        "BuildId": "6a4d2760-4295-417e-b149-0a12e3570d94",
        "Teams": [
            {
                "Name": "team1",
                "MinTeamSize": 4,
                "MaxTeamSize": 4
            },
            {
                "Name": "team2",
                "MinTeamSize": 4,
                "MaxTeamSize": 4
            },
            {
                "Name": "team3",
                "MinTeamSize": 4,
                "MaxTeamSize": 4
            },
            {
                "Name": "team4",
                "MinTeamSize": 4,
                "MaxTeamSize": 4
            },
            {
                "Name": "team5",
                "MinTeamSize": 4,
                "MaxTeamSize": 4
            },
            {
                "Name": "team6",
                "MinTeamSize": 4,
                "MaxTeamSize": 4
            },
            {
                "Name": "team7",
                "MinTeamSize": 4,
                "MaxTeamSize": 4
            },
            {
                "Name": "team8",
                "MinTeamSize": 4,
                "MaxTeamSize": 4
            }
        ],
        "Rules": [
            {
                "Type": "RegionSelectionRule",
                "MaxLatency": 200,
                "Path": "Latency",
                "Weight": 1,
                "Name": "RegionSelectionRule"
            }
        ]
    }
```

## Cross-Device / Cross Platform

To limit games of a particular device or platform to match with each other, specify the device with a String Equality Rule. With the AttributeNotSpecifiedBehavior of `MatchAny`, tickets that do not specify such a device can opt to match with any device/platform. If matchmaking times are longer than expected, consider creating a separate queue per platform, with a cross-platform queue as needed to support cross-play.

```json
"MatchmakingQueue": {
    "Name": "CrossDeviceQueue",
    "MinMatchSize": 32,
    "MaxMatchSize": 32,
    "ServerAllocationEnabled": false,
    "BuildId": "6a4d2760-4295-417e-b149-0a12e3570d94",
    "Rules": [
        {
            "Type": "StringEqualityRule",
            "Attribute": {
                "Path": "DeviceType",
                "Source": "User"
            },
            "AttributeNotSpecifiedBehavior": "MatchAny",
            "Weight": 1,
            "Name": "CrossDeviceRule"
        }
    ]
}
```

## Host/Searcher or Role Based Requirements

PlayFab Match uses a ticket-based matching system, where a game host is not selected ahead of time. However, it can emulate a host-searcher system by using a `MatchTotalRule` to limit the number of hosts allowed in a match.

Tickets can then specify ahead of time if it is a host by specifying 1. Each match must contain exactly one host.

> [!NOTE]
> If the number of hosts vastly outnumbers the searchers or vice-versa, this may cause slow matchmaking times for all players. Consider the implications of your matchmaking design to ensure there are enough players in any given subpopulation to satisfy your matchmaking rules and the desired average time to match.

```json
"MatchmakingQueue": {
    "Name": "HostSearcherQueue",
    "MinMatchSize": 8,
    "MaxMatchSize": 8,
    "ServerAllocationEnabled": false,
    "BuildId": "6a4d2760-4295-417e-b149-0a12e3570d94",
    "Rules": [
        {
            "Type": "MatchTotalRule",
            "Attribute": {
                "Path": "IsHost",
                "Source": "User"
            },
            "Min": 1,
            "Max": 1,
            "Weight": 1,
            "Name": "OneHostRule"
        }
    ]
}
```

Games may have role requirements - for instance, a game may require one drummer, two guitarists, and one vocalist. Or one tank, two DPS, and one support. Games may use the `MatchTotalRule` to require these roles as shown below.

```json
"MatchmakingQueue": {
    "Name": "RoleBasedQueue",
    "MinMatchSize": 4,
    "MaxMatchSize": 4,
    "ServerAllocationEnabled": false,
    "BuildId": "6a4d2760-4295-417e-b149-0a12e3570d94",
    "Rules": [
        {
            "Type": "MatchTotalRule",
            "Attribute": {
                "Path": "TankSelected",
                "Source": "User"
            },
            "Min": 1,
            "Max": 1,
            "Weight": 1,
            "Name": "TankRule"
        },
        {
            "Type": "MatchTotalRule",
            "Attribute": {
                "Path": "DPSSelected",
                "Source": "User"
            },
            "Min": 2,
            "Max": 2,
            "Weight": 1,
            "Name": "DPSRule"
        },
        {
            "Type": "MatchTotalRule",
            "Attribute": {
                "Path": "SupportSelected",
                "Source": "User"
            },
            "Min": 1,
            "Max": 1,
            "Weight": 1,
            "Name": "SupportRule"
        }
    ]
}
```

## Rules with varying importance

Rules guide matchmaking by both restricting what tickets are eligible to match with another, and choosing the order in which those tickets are picked. When multiple rules are present, all their restrictions are taken into account. However, a title may wish to give more priority to a rule's preference over the remaining eligible tickets.

In the example below, a player must be within a skill and experience level. However, if there are many tickets within the designated skill and experience
boundaries, this queue prefers the ones closer in skill as opposed to the ones closer in experience level.

Skill differences are counted *three times as much*
as experience differences, when evaluating the tickets that have met the restrictions.

```json
"MatchmakingQueue": {
    "Name": "WeightingQueue",
    "MinMatchSize": 4,
    "MaxMatchSize": 4,
    "ServerAllocationEnabled": false,
    "BuildId": "6a4d2760-4295-417e-b149-0a12e3570d94",
    "Rules": [
        {
            "Type": "DifferenceRule",
            "Difference": 1,
            "MergeFunction": "Average",
            "Attribute": {
                "Path": "skill",
                "Source": "User"
            },
            "AttributeNotSpecifiedBehavior": "MatchAny",
            "Weight": 3,
            "Name": "SkillRule"
        },
        {
            "Type": "DifferenceRule",
            "Difference": 5,
            "MergeFunction": "Average",
            "Attribute": {
                "Path": "experience",
                "Source": "User"
            },
            "AttributeNotSpecifiedBehavior": "MatchAny",
            "Weight": 1,
            "Name": "ExperienceRule"
        }
    ]
}
```

## DLC packs

With various DLC packs, players may opt to only find other players that have a matching DLC, using a `SetIntersectionRule`. Each player passes in the DLC packs they own, and a match requires a group to share at least one DLC pack.

> [!NOTE]
> After 30 seconds, the rule becomes optional, allowing players to match without sharing DLC.

```json
"MatchmakingQueue": {
    "Name": "DlcQueue",
    "MinMatchSize": 4,
    "MaxMatchSize": 4,
    "ServerAllocationEnabled": false,
    "BuildId": "6a4d2760-4295-417e-b149-0a12e3570d94",
    "Rules": [
        {
            "Type": "SetIntersectionRule",
            "MinIntersectionSize": 1,
            "Attribute": {
                "Path": "DlcPacks",
                "Source": "User"
            },
            "AttributeNotSpecifiedBehavior": "MatchAny",
            "Weight": 1,
            "Name": "DlcRule",
            "SecondsUntilOptional": 30
        }
    ]
}
```

## Enabling Statistics

Enabling statistics allows your title to display information about a queue. This information can be useful for setting player expectations as they choose a game mode they would like to play.

Conversely, titles may wish to hide this information - either for business intelligence purposes, or to avoid directing players into high-traffic queues.

The queue below enables both the ability to see the number of players present in a queue and an estimated time a ticket takes to match.

> [!NOTE]  
> A server may always retrieve this information - the configuration shown below only controls whether users are allowed to make this call as well.

```json
"MatchmakingQueue": {
    "Name": "StatisticsEnabledQueue",
    "MinMatchSize": 8,
    "MaxMatchSize": 8,
    "ServerAllocationEnabled": false,
    "Rules": [],
    "StatisticsVisibilityToPlayers": {
        "ShowNumberOfPlayersMatching": true,
        "ShowTimeToMatch": true
    }
}
```