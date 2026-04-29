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

The system of queues and rules provides the flexibility to handle a large number of scenarios. Here are examples of some of the more common matchmaking use cases, and their associated queues. You can submit each of these configurations directly by using PlayFab APIs. <!--the [Matchmaking Admin API](xref:titleid.playfabapi.com.multiplayer.matchmakingadmin).--> You can also set these options by using the Game Manager UI.

## My first queue, or "quick match"

Every title should begin with this simple queue to work out their basic flows. This queue matches two players together, and contains one optional rule that requires players to pass in the same build string in order to match. If you don't specify a build, the player can match with other players in this queue, regardless of build.

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

If players are intended to match with others across game modes, use a single queue and create a Set Intersection rule. Players can specify multiple game modes, and the rule restricts matches to ones where all players contain at least one common game mode.

> [!NOTE]  
> The number of players required to play must be the same across modes for this functionality to work correctly.

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

## Skill-based free-for-all game, with expansion

A common scenario is attempting to match players together based on *skill*. In this example, the queue requires players' skill attributes to be within 0.2, with these attributes increasing over time to 0.5. For tickets waiting for more than 30 seconds, any skill difference is allowed.

The values for this example assume the ranges of available skills are between 0 and 1. Adjust these values to fit the range of values your title uses to track the skills of its players, and how much emphasis is placed on skill over the speed of a match.

In addition, the rule becoming optional at 30 seconds is intended for games where it's better to play a game with unbalanced skills than to not play at all. For games where an unbalanced game is entirely a negative experience, adjust `SecondsUntilOptional`. If removed entirely, it causes the rule to remain active indefinitely.

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

You can customize expansions to use arbitrary values in each time interval. For instance, you might want the allowed skill to grow slowly to start, and later grow more quickly over time.

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

Some titles prefer having a full match to begin with, but over time might be satisfied with fewer and fewer people. One such example is a Battle Royale style game that is designed to start with up to 50 players but can proceed with fewer players after a matchmaking timeout.

Because `MinMatchSize` and `MaxMatchSize` don't contain an expansion, you can use a `MatchTotalRule` to modify the number of players required for a match. Each player sets the associated attribute to 1. The rule sums these values to dynamically enforce the required number of players for a match.

> [!NOTE]  
> If you don't specify a `MaxOverrides` or `MinOverrides` array, the rule's original `Max` or `Min` value is used in its place.

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

PlayFab Matchmaking supports team-oriented matches. When you specify teams, players that you submit together in the same ticket are all allocated into one team, and they aren't forced to play against each other.

PlayFab Matchmaking also supports various team rules to help ensure teams are balanced. This example is for a 4v4 match, and it ensures the skills are balanced across teams.

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

When you set the `ServerAllocationEnabled` flag to `true`, you must also include a `RegionSelectionRule` to indicate where a server should be allocated for each match.

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

## Large Team Battle (12 vs 12)

Larger team games might have extra requirements. In this example, the queue is configured to create a multiplayer server, which is often required to manage games with this many players. This configuration is similar to the previous example.

In addition to skill, add another Team Rule to encourage team similarity. Only one large team is allowed on each side, preventing a common situation of a premade team being matched against a large set of random players.

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

## Battle Royale style games

Battle Royale style games place many people into an arena. In this example, the game is set up with teams of four. Currently, there's a limit of 32 players allowed in a team scenario such as this one. This limitation will be improved in the future.

This example also contains multiplayer server setup information for dedicated servers, which is often necessary for games with large numbers of players. This configuration is similar to the previous example.

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

## Handling asymmetric cross-play preferences

Because players can choose different cross-play settings, matchmaking preferences are asymmetric. Players who enable cross-play are willing to match with any platform, while players who disable cross-play only want to match with players on their own platform.

You can use a string equality rule or a set intersection rule to implement a matchmaking queue that can handle this type of asymmetry. This particular example uses string equality. 

If a player disables cross-play, the client specifies their `DeviceType` (for example, `"xbox"`, `"playstation"`), and the rule restricts them to same-platform matches. If a player enables cross-play, the client omits the `DeviceType` attribute entirely, and the `AttributeNotSpecifiedBehavior` of `MatchAny` allows them to match with any platform.

> [!NOTE]
> When a group of players submits a ticket together, the service treats the group as a single unit—it doesn't split the group across matches or teams. Your game client should validate group composition before ticket submission. For example, if a player has cross-play disabled, prevent them from joining a cross-platform group before the ticket is created.

If matchmaking times are longer than expected, consider creating a separate queue per platform, with a cross-platform queue as needed to support cross-play.

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

PlayFab Match uses a ticket-based matching system, where a game host isn't selected ahead of time. However, it can emulate a host-searcher system by using a `MatchTotalRule` to limit the number of hosts allowed in a match.

Tickets can then specify ahead of time if it's a host by specifying 1. Each match must contain exactly one host.

> [!NOTE]
> If the number of hosts vastly outnumbers the searchers or vice-versa, this imbalance might cause slow matchmaking times for all players. Consider the implications of your matchmaking design to ensure there are enough players in any given subpopulation to satisfy your matchmaking rules and the desired average time to match.

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

Games might have role requirements. For example, a game might require one drummer, two guitarists, and one vocalist. Or one tank, two damage per second (DPS), and one support. Games might use the `MatchTotalRule` to require these roles.

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

Rules guide matchmaking by both restricting what tickets are eligible to match with another, and choosing the order in which those tickets are picked. When multiple rules are present, the system takes into account all their restrictions. However, a title might prioritize a rule’s preference over the remaining eligible tickets.

In this example, a player must be within a skill and experience level. However, if many tickets fall within the designated skill and experience
boundaries, this queue prefers the ones closer in skill rather than the ones closer in experience level.

Skill differences count *three times as much*
as experience differences when evaluating the tickets that meet the restrictions.

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

By using various DLC packs, players can opt to only find other players that have a matching DLC by using a `SetIntersectionRule`. Each player passes in the DLC packs they own, and a match requires a group to share at least one DLC pack.

> [!NOTE]
> After 30 seconds, the rule becomes optional, so players can match without sharing DLC.

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

## Enabling statistics

When you enable statistics, your title can display information about a queue. This information can be useful for setting player expectations as they choose a game mode they want to play.

Conversely, titles might wish to hide this information - either for business intelligence purposes, or to avoid directing players into high-traffic queues.

This queue enables both the ability to see the number of players present in a queue and an estimated time a ticket takes to match.

> [!NOTE]  
> A server can always retrieve this information. The following configuration only controls whether users are allowed to make this call as well.

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