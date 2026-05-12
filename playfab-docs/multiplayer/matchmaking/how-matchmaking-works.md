---
title: How matchmaking works
author: keithrkline
description: Learn how PlayFab Matchmaking evaluates tickets, applies rules, and forms matches.
ms.author: kkline
ms.date: 04/10/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, matchmaking, algorithm, rules, expansion
ms.localizationpriority: medium
---

# How matchmaking works

This article describes how PlayFab Matchmaking evaluates tickets, applies rules, and forms matches. Understanding the matching process helps you design queue configurations that produce high-quality matches efficiently.

## Match formation overview

When you submit a ticket to a queue, the matchmaking service places it alongside other waiting tickets. The service continuously runs a **match loop** that attempts to group compatible tickets into matches. Here's what happens at each step:

1. **Expired tickets are removed.** Tickets that exceed their `GiveUpAfterSeconds` timeout are canceled.
1. **Tickets are sorted by wait time:** The longest-waiting ticket becomes the **seed**, or starting point, for a potential match.
1. **Candidates are ranked by compatibility:** Each remaining ticket receives a **distance score** based on how well its attributes align with the seed ticket, according to the queue's rules.
1. **A group is built greedily:** Starting with the closest candidates, tickets are added to the group one at a time, up to `MaxMatchSize`.
1. **Each addition is validated:** As a ticket is added, every rule checks whether the candidate is still compatible with the group so far. If any rule rejects it, the candidate is skipped.
1. **The complete group is validated:** Once a group reaches at least `MinMatchSize`, a final validation pass confirms the group satisfies all rules. If it passes, a match is created.
1. **Backtracking:** If no valid group can be formed, the service removes the last-added ticket and tries the next candidate. This process explores alternative groupings before giving up on the current seed.

The service then moves to the next longest-waiting ticket as a new seed and repeats the process.

> [!NOTE]
> The algorithm prioritizes the longest-waiting tickets. This priority ensures that players who wait the longest are the first to receive matches.

## How rules influence matching

Rules serve two purposes during match formation: **filtering** and **sorting**.

### Filtering

A rule can block a ticket from joining a group. For example, a `StringEqualityRule` on game build version rejects any ticket whose build doesn't match the group's build. The matchmaking service checks filtering each time it considers a candidate. It's not just a one-time check at the start.

### Sorting (distance)

Rules also contribute a **distance score** that determines which candidates are tried first. Lower distance means higher compatibility.

+ A ticket with an identical attribute value generally scores distance **0**.
+ A ticket at the edge of a rule's allowed range scores distance near **1**.
+ A ticket outside the allowed range is filtered out (effectively infinite distance).

When a queue has multiple rules, each rule's distance is multiplied by its [weight](config-queues.md) and summed together. Tickets are tried in order from lowest to highest total distance, so the most compatible candidates are tried first.

> [!TIP]
> Use rule weights to express relative importance. For example, if skill similarity matters more than region preference, give the skill rule a higher weight.

### Validation

Some constraints can only be checked after a complete group is formed. For example, team balance rules (`TeamDifferenceRule`, `TeamSizeBalanceRule`) need to see the full group before they can evaluate whether the teams are balanced. These rules run as a final validation step.

## Expansion and relaxation

When a ticket waits, rules **relax** their constraints to widen the search. Two mechanisms control this process:

+ **Expansion**: A rule gradually adjusts its threshold over time. For example, a `DifferenceRule` with a skill threshold of 0.2 might expand by 0.1 every 5 seconds, eventually allowing a difference of 0.5.
+ **Seconds until optional**: After a configured time, the rule stops filtering entirely. The rule still contributes to sorting (distance), but it no longer blocks matches.

Expansion is always **time-based**. It applies uniformly to all tickets based on how long they've been waiting. Tickets that wait longer naturally reach broader expansion stages and can match with a wider pool of candidates.

> [!NOTE]
> Relaxation doesn't mean match quality is ignored. Even when a rule becomes optional, it still contributes distance to the sorting step. Candidates that satisfy the rule are tried before those that don't.

For more detail on configuring expansions, see [Configuring matchmaking queues](config-queues.md).

## Scaling and partitioning

When a queue receives a high volume of tickets, the service **partitions** tickets into groups that it evaluates independently. Partitioning uses rule attributes that naturally divide the population. For example, a `StringEqualityRule` on game mode creates clean partition boundaries.

As load decreases, partitions merge back together. This process gives the service a larger pool of candidates and improves match quality.

For more detail on designing queues that scale well, see [Matchmaking scaling](matchmaking-partition.md).

## Designing for asymmetric preferences

Some matchmaking scenarios involve asymmetric preferences—where Player A is willing to match with Player B, but Player B isn't willing to match with Player A. Cross-play settings are the most common example. For a recommended configuration pattern and worked example, see [Handling asymmetric cross-play preferences](config-examples.md#handling-asymmetric-cross-play-preferences).

## See also

+ [Configuring matchmaking queues](config-queues.md)
+ [Matchmaking scenario and configuration examples](config-examples.md)
+ [Matchmaking scaling](matchmaking-partition.md)
