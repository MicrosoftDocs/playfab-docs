---
title: Understanding rule weight in matchmaking
author: keithrkline
description: Explains how the Weight property on matchmaking rules affects match quality and ticket sorting
ms.author: kkline
ms.date: 02/24/2026
ms.topic: conceptual
ms.service: azure-playfab
keywords: playfab, multiplayer, matchmaking, weight, rules, configuration
ms.localizationpriority: medium
---

# Understanding rule weight in matchmaking

## Overview

When you configure a matchmaking queue, you can assign each rule a **Weight** value. Weight is a numeric multiplier that controls how much influence a particular rule has when the matchmaking system ranks and sorts eligible tickets. It doesn't change whether a ticket passes or fails a rule—it only affects **how important that rule is relative to others** when determining which tickets are the best candidates for a match.

Understanding weight is essential for tuning match quality. By adjusting weights across your rules, you can prioritize what matters most for your game—whether that's skill balance, geographic proximity, or shared content.

## How weight works

Every rule that supports weight computes a **distance** value for each pair of tickets being evaluated. This distance represents how similar or different two tickets are according to that rule:

- A distance of **0** means the tickets are a perfect match for that rule.
- A distance closer to **1** means the tickets are at the edge of what the rule allows.
- A distance of **infinite** (hard rejection) means the tickets can't match according to that rule, regardless of weight.

The matchmaking system calculates a **total distance** across all weighted rules using the following formula:

```
totalDistance = Σ (rule.Weight × rule.Distance)
```

Tickets with a lower total distance are considered better candidates and are tried first when building a match. Weight acts as a scalar multiplier on each rule's contribution to this total.

> [!IMPORTANT]
> Weight does **not** override hard restrictions. If a rule determines that two tickets are incompatible, the tickets are excluded entirely. For example, this happens with a Difference Rule where the values exceed the maximum allowed difference. Weight only influences the **priority order** among tickets that are already eligible.

## How each rule computes distance

Before you look at weight examples, it helps to understand how each weighted rule computes its distance value. The distance is always a number between 0 and 1, where lower values indicate a closer match.

| Rule type | Distance formula | Distance = 0 | Distance = 1 |
|-----------|-----------------|---------------|--------------|
| Difference | `absoluteDifference / maxDifference` | Player values are identical | Players differ by the full allowed amount |
| String Equality | 0 if strings match; 1 if the rule is optional and strings differ | Strings are identical | Rule is optional and strings differ |
| Set Intersection | `1 / (1 + sharedItemCount)` | N/A (minimum is 0.5 with one shared item) | No shared items (`1 / (1 + 0) = 1`) |
| Match Total | `(maxTotal - (groupTotal + ticketValue)) / maxTotal` | Group is at the target capacity | Group is far from the target total |
| Region Selection | `1 / (1 + Σ qualityTerms)` | Many low-latency common regions | Few or poor common regions |

## Which rules support weight

Weight applies to the **standard rule types** that participate in distance-based sorting. The following rules support the Weight property:

| Rule type | Supports Weight |
|-----------|:-:|
| String Equality | ✔ |
| Difference | ✔ |
| Set Intersection | ✔ |
| Match Total | ✔ |
| Region Selection | ✔ |

The following **team rule types** do **not** support weight. These rules act as validators—they either pass or fail a match and don't participate in distance-based sorting:

| Rule type | Supports Weight | Behavior |
|-----------|:-:|-------------|
| Team Difference | ✘ | Validates that team averages are within an allowed difference |
| Team Size Balance | ✘ | Validates that team player counts are balanced |
| Team Ticket Size Similarity | ✘ | Validates that teams have similar party compositions |

## Valid weight values

Weight must be a number **greater than 0** and **up to 1000** (inclusive). A weight of 0 isn't permitted. If no weight is specified, the default value is **1**.

## Examples

The following examples use a queue with a **Difference Rule** for skill and a **Set Intersection Rule** for preferred game maps. Three players—Alice, Bob, and Charlie—are in the queue. The matchmaking system needs to decide which of the two candidates (Bob or Charlie) is the better match for Alice.

### Queue configuration

```json
"Rules": [
    {
        "Type": "DifferenceRule",
        "Name": "SkillRule",
        "Attribute": { "Path": "skill", "Source": "User" },
        "MaxDifference": 10,
        "MergeFunction": "Average",
        "Weight": 1
    },
    {
        "Type": "SetIntersectionRule",
        "Name": "MapRule",
        "Attribute": { "Path": "preferredMaps", "Source": "User" },
        "MinIntersectionSize": 1,
        "Weight": 1
    }
]
```

### Player attributes

| Player | Skill | Preferred Maps |
|--------|-------|----------------|
| Alice | 20 | "Dustbowl", "Summit", "Lakeside" |
| Bob | 24 | "Dustbowl," "Summit" |
| Charlie | 17 | "Lakeside" |

### Step 1: Compute per-rule distances

**SkillRule** (Difference Rule) uses the formula `absoluteDifference / maxDifference`:

- Alice vs Bob: `|20 - 24| / 10 = 4 / 10 = 0.4`
- Alice vs Charlie: `|20 - 17| / 10 = 3 / 10 = 0.3`

**MapRule** (Set Intersection Rule) uses the formula `1 / (1 + sharedItemCount)`:

- Alice vs Bob: They share "Dustbowl" and "Summit" (two items) → `1 / (1 + 2) = 0.33`
- Alice vs Charlie: They share "Lakeside" (one item) → `1 / (1 + 1) = 0.5`

### Example 1: Equal weights

With both rules at Weight = 1, the total distance is:

```
Bob:     totalDistance = (1 × 0.4)  + (1 × 0.33) = 0.73
Charlie: totalDistance = (1 × 0.3)  + (1 × 0.5)  = 0.80
```

**Result:** Bob (0.73) is a better match than Charlie (0.80). Even though Charlie is closer in skill, Bob shares more maps with Alice, and both rules contribute equally. Bob is tried first.

### Example 2: Prioritizing skill (Weight = 10 on SkillRule)

If your game is competitive and skill balance matters most, increase the SkillRule weight:

```json
{
    "Type": "DifferenceRule",
    "Name": "SkillRule",
    ...
    "Weight": 10
},
{
    "Type": "SetIntersectionRule",
    "Name": "MapRule",
    ...
    "Weight": 1
}
```

Now the total distances change:

```
Bob:     totalDistance = (10 × 0.4)  + (1 × 0.33) = 4.33
Charlie: totalDistance = (10 × 0.3)  + (1 × 0.5)  = 3.50
```

**Result:** Charlie (3.50) is now the better match. The higher weight on skill means Charlie's closer skill level (three difference vs 4) outweighs the fact that Bob shares more maps. Skill dominates the sort order.

### Example 3: Prioritizing shared maps (Weight = 10 on MapRule)

If your game is casual and players care most about playing on their favorite maps, increase the MapRule weight instead:

```json
{
    "Type": "DifferenceRule",
    "Name": "SkillRule",
    ...
    "Weight": 1
},
{
    "Type": "SetIntersectionRule",
    "Name": "MapRule",
    ...
    "Weight": 10
}
```

Now the total distances become:

```
Bob:     totalDistance = (1 × 0.4)  + (10 × 0.33) = 3.70
Charlie: totalDistance = (1 × 0.3)  + (10 × 0.5)  = 5.30
```

**Result:** Bob (3.70) is preferred. Sharing two maps with Alice gives Bob a significant advantage, and the small skill gap with Charlie barely matters. Map preference dominates the sort order.

### Example 4: When players can't match (hard rejection)

Now add a fourth player, **Dave**, whose skill is far from Alice's and who shares no preferred maps:

| Player | Skill | Preferred Maps |
|--------|-------|----------------|
| Alice | 20 | "Dustbowl," "Summit," "Lakeside" |
| Dave | 35 | "Fortress" |

**SkillRule:** `|20 - 35| / 10 = 15 / 10 = 1.5`—but the difference of 15 exceeds `MaxDifference` (10), so the rule returns **infinite distance** (hard rejection).

**MapRule:** Alice and Dave share 0 maps, and `MinIntersectionSize` is 1, so this rule also returns **infinite distance**.

```
Dave: totalDistance = infinite  (skill difference 15 > MaxDifference 10 → hard rejection)
```

No matter how the weights are configured, Dave can't match with Alice. Even if only one rule returns infinite distance, the entire total distance becomes infinite and the ticket is excluded from the candidate list. Weight can't override a hard rejection—it can only influence priority among tickets that are already eligible. To allow players like Dave to eventually match, use [rule expansions](config-queues.md#expansions-and-becoming-optional) to relax the restrictions over time.

### Summary of the examples

The table below shows how weight changes which candidate is preferred, using the same player attributes and the same rules—only the weights differ.

| Weight configuration | Bob's total distance | Charlie's total distance | Dave's total distance | Best match for Alice |
|---|:-:|:-:|:-:|---|
| Skill = 1, Maps = 1 (equal) | 0.73 | 0.80 | ∞ (rejected) | Bob |
| Skill = 10, Maps = 1 (skill priority) | 4.33 | 3.50 | ∞ (rejected) | Charlie |
| Skill = 1, Maps = 10 (map priority) | 3.70 | 5.30 | ∞ (rejected) | Bob |

The underlying distances never change—only the relative importance assigned to each rule changes. Dave is always rejected because the player's attributes exceed the hard limits, regardless of weight. This approach is the power of weight tuning.

## Weight and rule expansions

When a rule becomes optional (through [Seconds until optional](config-queues.md#expansions-and-becoming-optional) or expansion), it no longer hard-rejects tickets. However, tickets that would be rejected still receive a nonzero distance value. Weight continues to scale this distance, which means optional rules still influence the sort order—they push "violating" tickets lower in priority rather than excluding them entirely.

This behavior is useful for ensuring that even when rules relax over time, the best matches are still preferred.

## Best practices

- **Start with equal weights** and adjust based on match quality feedback from your players.
- **Use higher weights** on the rules that are most important to your game's experience (such as skill for competitive titles, or shared content for casual games).
- **Remember that weight only affects sorting**—it can't make an impossible match happen. Use [expansions](config-queues.md#expansions-and-becoming-optional) to relax hard restrictions over time.
- **Avoid extreme weight ratios** (such as 1000:1) unless you intentionally want one rule to completely overshadow all others.

## See also

- [Configuring matchmaking queues](config-queues.md)
- [Matchmaking scenario and configuration examples](config-examples.md)
- [Specifying attributes with your tickets](ticket-attributes.md)
