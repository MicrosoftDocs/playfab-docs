---
title: Matchmaking scaling
author: keithrkline
description: Describes how matchmaking scales under load
ms.author: kkline
ms.date: 02/25/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, matchmaking, partition, scaling, performance
ms.localizationpriority: medium
---

# How matchmaking scales under load

## Overview

When a queue receives a high volume of tickets, the service automatically scales its processing to maintain low match latency. As load increases, tickets are grouped using your queue's configured rules so that similar tickets—tickets more likely to be compatible—are evaluated together. As load decreases, these groups consolidate, giving the service a larger pool of tickets to choose from and improving match quality.

This scaling is transparent to players, but the rules you configure on a queue influence how effectively the service can distribute work. Understanding this process can help you design queue configurations that scale efficiently.

## What makes a rule scale well

When the service needs to distribute tickets across its processing capacity, it looks for rule attributes that naturally divide tickets into roughly equal groups. Rules with a wide range of distinct values work best—they give the service more options for balancing load evenly.

If no rule provides a good distribution, the service falls back to a general-purpose distribution that balances load without relying on rule attributes. For example, this happens when most tickets share identical attribute values.

### Rules that partition well

+ **String equality rules with diverse values**—Rules like `GameMode` or `Region` that have multiple distinct values across your player population create natural partition boundaries. The service can cleanly divide tickets into groups that share the same value.
+ **Required rules**—Rules that remain enforced throughout matching (without an expansion) are preferred for partitioning because they represent hard constraints. Splitting on these rules ensures that partition boundaries align with your strongest match requirements.
+ **Higher-weighted rules**—Rules with a greater [weight](rule-weights.md) are prioritized for partitioning. This approach means the rules you consider most important for match quality are also the ones most likely to guide how tickets are distributed.
+ **Difference rules with a spread of values**—Numeric rules like skill rating work well when player values are distributed across a range, allowing the service to split tickets into groups with similar values.

### Rules that are less effective for partitioning

+ **Rules where most tickets share the same value**—If nearly all players submit the same attribute value for a rule, the service can't use that rule to create a meaningful split.
+ **Rules with heavy wildcard usage**—When a large proportion of tickets uses a wildcard (match-any) value for a rule, that rule becomes less useful for dividing tickets into distinct groups.
+ **Rules with expansions**—Rules that become optional over time are deprioritized for partitioning because they represent softer constraints that may not hold during a ticket's lifetime.

## Design considerations

When designing matchmaking queues for games that may experience high ticket volumes, keep the following considerations in mind:

+ **Distribute attribute values**—Rules with diverse attribute values across your player population produce better partition splits. If most players share the same value for a rule, it doesn't help balance load across partitions.
+ **Weight important rules higher**—The [weight](rule-weights.md) of a rule affects both match sorting priority and partition splitting priority. Assigning higher weights to the rules most important for match quality ensures those rules also guide how tickets are distributed.
+ **Avoid unnecessary wildcards**—When a large proportion of tickets uses wildcard values for a rule, that rule becomes less useful for partitioning. Consider whether wildcard behavior is necessary for your game design.
+ **Retries during partition changes are normal**—When the partition layout changes due to a split or merge, some tickets may be briefly canceled with a retry signal. The matchmaking SDK handles this automatically, so players experience only a momentary delay.

