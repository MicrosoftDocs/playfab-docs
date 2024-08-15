---
title: Configuring matchmaking queues
author: keithrkline
description: Describes how to properly configure matchmaking queues
ms.author: kkline
ms.date: 03/15/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, matchmaking, match, config
ms.localizationpriority: medium
---

# Configuring matchmaking queues

## Overview

Match configuration centers around queues, which represent a place where tickets wait to be matched with each other. Each queue has some general configuration about what is required for a match. In addition, it can contain a set of rules which provide further restrictions on how tickets are matched together.

## Queue configuration

At the queue level, the configuration describes basic requirements regarding how tickets are matched inside a queue, as well as how you obtain statistics information about the queue.

### Queue name

The name for a specific queue. It is between 1 and 64 characters long (inclusive) and is case-sensitive. It is alpha-numeric, plus underscores and hyphens, and starts with a letter or number. Generally a queue name represents a way to play a game, such as "4v4CaptureTheFlag" or "UnrankedRace". When creating a matchmaking ticket, the queue name must be specified to identify which queue it should enter.

### Match size

The range of players allowed in a match. The minimum match size must be greater than or equal to 2, and the maximum match size must be less than or equal to 100 (this limit is 32, if using teams).

In addition, even if a ticket alone already meets the minimum requirements for a match, it won't return a match found until it matches at least one other ticket. If a ticket already meets the maximum requirement for a match, however, it will be rejected.

### Statistics available to players

This determines which queue statistics are exposed to players through the [GetQueueStatistics API](xref:titleid.playfabapi.com.multiplayer.matchmaking.getqueuestatistics). Servers always have access to all statistics. See the [Displaying queue statistics in your title](display-statistics.md) tutorial for more information.

There are two options you can control within this:

1. **Show the number of players matching** - Whether the number of players waiting for a match is exposed to players. Titles may use this to hide the relative popularity of the mode, or to keep player counts hidden for business reasons.
2. **Show the time to match statistics** - Whether the time to match statistics (average and percentiles) are exposed to players.

### Teams

A queue can include team configuration to have the match service assign players to teams. Additional team-specific rules can be used to control how team assignment is done. Furthermore, the match service will ensure that players matching together in the same ticket are not assigned to different teams.

You can have 2 or more teams defined in a queue.

+ **Team name** - The name used for this team. Team names are between 1 and 64 characters long (inclusive) and are case-sensitive. They are alphanumeric, plus underscores and hyphens, and start with a letter or number. In addition they must be unique within a queue.
+ **Team size** - Minimum and maximum number of players that can be on the team. Matchmaking will try to form teams with as many players as possible up to the maximum.

Besides defining the teams and their sizes, additional rules can be enabled to help with how to handle teams in matchmaking. See [below](#team-rule-types) for information on team-specific rules.

## Rule configuration

Rules may be optionally defined for a queue. When configured, they help the matchmaking algorithm determine which tickets should match together. Each rule applies to a single attribute in the player metadata. You can have a maximum of 20 rules defined for a single queue.

There are many types of rules. Each contains some common configurable elements, as well as elements that are specific to that particular type of rule. In addition, many rules allow an expansion, in which the rules become less restrictive over time.

### Common rule elements

The elements below are often used by all rules.

+ **Rule Name** - The name must be between 1 and 255 characters long (inclusive), is alpha-numeric plus underscores and hyphens, and must start with a letter or number. Rule names must be unique within a queue.
+ **Weight** - A way to modify the importance of a rule. Rules in general provide both a restriction as well as a way to sort the remaining tickets that are eligible. The weight is a multiplier, modifying how important the rule is for sorting purposes.
+ **Attribute Source** - Rules often act upon information that is provided to them. This field describes two options for the source of this information:

  1. **User** - Attributes are submitted alongside players in the create or join ticket request.
  2. **Player Entity** - Attributes are retrieved from the player's associated Player Entity. These can be set via the [SetObjects API](xref:titleid.playfabapi.com.data.object.setobjects)
+ **Attribute Path** - The path to reach the attribute. When using a User Attribute Source, it is simply the name of the attribute. When using a Player
  Entity Attribute Source, it is a [JSONPath](https://github.com/json-path/JsonPath) that retrieves a particular item from the entity, such as `$.playerSkill.Mean`.
+ **Behavior when attribute is not specified** - If a rule requires an attribute, but none is specified, the rule may be configured with one of two behaviors:

  1. It may supply a default value for the attribute.
  2. It may use this as a signal to indicate the ticket meets any restriction supplied by the rule. This may be useful if for instance, some players express a preference, and another player is willing to match anyone. The player with no preference can neglect to supply an attribute, and match with any other players.

### Standard rule types

Each of the rule types is listed below, along with its purpose, some common uses, and any specific configuration the rule may require.

| Rule type       | Description | Common Uses | Rule-specific fields |
|-----------------|-------------|-------------|----------------------|
| String Equality | Ensures that a string attribute is the same across all tickets in a match. |  Requires build versions or other specific items to match | none |
| Difference | Ensures that the absolute difference for a number attribute between any two tickets in a match is less than a configured maximum difference. |  Groups players by skill, experience, or other numeric comparisons |  Merge function - Select how multiple player values are merged into one value representing the ticket. Choices are min, max, and average. Defaults to average. |
| Set Intersection | Ensures that for a given attribute that is a list of strings, all tickets in a match share at least as many values as is configured. | DLC or map selection | Min intersection size - Minimum number of shared items for a match. |
| Match Total | Ensures that the sum of a number attribute across all players in a match is within a configured range. | Role selection, emulating host/server matchmaking, adjusting player count restrictions over time | Min/Max total - Sum of attribute must be within these inclusive bounds. |
| Region Selection | Ensures that the latency to a common data center for all users of the match is less than a configured max value. | Required for multiplayer server integration | Max Latency - Only datacenters within this max latency are eligible for a match. |

### Team rule types

Team rules can only be set if teams are present in the queue configuration. They provide additional ways to require balance between the teams. The following team rules are available:

| Rule type       | Description | Common Uses | Rule-specific fields |
|-----------------|-------------|-------------|----------------------|
| Team Difference | Ensures that teams included in a match are within a configured difference for a specific attribute (such as skills). This is very similar to a standard Difference Rule, except that the values compared are each team's average value. | Balancing skills across teams | none |
| Team Size Balance | Ensures the difference in player count between the largest and smallest team does not exceed a threshold. For instance, this rule could be used to create a queue where 3v3 and 4v4 matches are allowed, but a 3v4 is not. | Player count balance across teams | Allowed Team Size Difference - How uneven the teams can be, as measured by the difference in the number of players assigned to each one. |
| Team Ticket Size Similarity | Ensures that all teams either have a large party, or do not have a large party. A large party is defined as at least half of the maximum team's size. | Prevents parties (pre-made teams) from matching with a group of solo players. | none |

### Expansions and becoming optional

Rules may become optional or less restrictive over time, allowing tickets that have waited for some time to search wider for a potential match. There are two methods for controlling this behavior:

1. **Seconds until optional** - Simply indicates a length of time that the rule is active. The rule no longer restricts matches among tickets that have waited this time.

2. **Expansion process** - Rules gradually adjust their configured thresholds over time. For instance, a Difference Rule may require matches within a particular maximum difference. As a ticket waits, the rule may expand the maximum difference, permitting expansion to a larger and larger range for the ticket, and allowing it to be matched even if perfect opponents are unavailable.

Expansions can be either **linear** or **custom**. In a linear expansion, a value grows over time, using a fixed change after each time interval. The items customized in a linear expansion are:

+ **Seconds between expansions** - How long in between each instance of the rule changing its restrictions.
+ **Delta** - The change of the value.
+ **Limit** - The end value. The rule never expands beyond this point.

In a custom expansion, the rule can use an arbitrary value each time the rule changes its restrictions. The following fields are used:

+ **Seconds between expansions** - How long in between each instance of the rule changing its restrictions
+ **One or more custom fields** that modifies a rule during the expansion. Each field is semicolon delimited to represent a different value which is used in each expansion's interval. The word "null" may be used in place of a value to indicate the rule is not active during this interval.

The exact field modified depends on the rule. The following chart describes which rules have which kinds of expansions, and what fields are modified by the expansion.

| Rule type        | Linear Expansion Allowed? | Custom expansion allowed? | Attribute modified during expansion |
|------------------|-------------|-------------|----------------------|
| String Equality  | no | yes | Whether rule is active or not |
| Difference       | yes | yes | Maximum allowed difference |
| Set Intersection | yes | yes | Minimum required intersection |
| Match Total      | no | yes | Minimum and maximum required totals |
| Region Selection | yes | yes | Maximum allowed latency |
| Team Difference  | yes | yes | Allowed difference in team values |
| Team Size Balance| yes | yes | Allowed difference in number of players per team |
| Team Ticket Size Similarity | no | no | n/a |

For more details on configuration use cases and examples, see [Matchmaking scenario and configuration examples](config-examples.md).
