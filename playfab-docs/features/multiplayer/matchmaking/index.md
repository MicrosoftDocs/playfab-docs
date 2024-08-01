---
title: Matchmaking
author: keithrkline
description: Matchmaking overview
ms.author: kkline
ms.date: 03/15/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, servers
ms.localizationpriority: medium
---

# Matchmaking
 

## Overview

The PlayFab Matchmaking feature provides a great way to build matchmaking into your game and offers a simple, yet powerful system to help your users find each other. This feature is an upgrade to PlayFab's existing matchmaker (deprecated) and uses the proven capabilities of Xbox Live's SmartMatch.

This marks the first time the firmly established technology of Xbox Live matchmaking has been available outside of the Xbox Live ecosystem, and it will be available to you
*everywhere* via PlayFab.

When an individual or group wants to enter a match, your title submits a request
to the matchmaking service. Once the request is made, the service will hold on
to the request and try to match it with other requests. The service then creates
matches that contain players who are most compatible.

## Terminology

There are a few common terms used throughout the matchmaking system that we'll need to define. They are:

+ **Ticket** - A ticket is the resource at the core of the matchmaking process. A ticket consists of a player or a list of players that want to play together, along with their attributes (such as in-game levels, favorite maps, or skill).
+ **Queue** - A queue is a collection of tickets to be matched together and a set of rules that controls how tickets are matched.
+ **Rule** - A rule is a constraint on which tickets are eligible to match. The matchmaking algorithm searches for a set of tickets that satisfy all the rules defined by a queue to create a match.
+ **Attribute** - An attribute is a value associated with a player that can have Rules applied to it. Attributes can be specified in either the ticket or the player's [Entity Objects](../../data/entities/entity-objects.md).

+ **Match** - A match is the output of the matchmaking process. It is a collection of tickets that satisfy all the rules for the queue the tickets were submitted to.

## Basics

When a player or group of players want to play together, one player creates a ticket for themselves or the entire group, and submits it to matchmaking through your title. The join flow ensures that all players in the group consent to
match together. Once the player or players have joined, the matchmaking process begins automatically. When matchmaking finds a suitable match, the title must group those matched players together into a game.

A ticket is submitted to a matchmaking queue. A title can have multiple queues. For example, a title might create one queue for a ranked game mode and another for a social game mode. Tickets can only match with other tickets in the same
queue, and a player may only be in one ticket at a time.

To define a queue, you must create a queue configuration. The simplest configuration consists of the queue name and the match size (a minimum and maximum number of players). The matchmaking service will attempt to fill the match to the max size provided, but if insufficient tickets are available a
match of the minimum size can be generated.

If you have different game modes with different match size requirements, it is best to create multiple queue configurations. For more advanced matchmaking scenarios, queue rules can be configured.

We currently support these rule types:

+ **String equality rule**: ensures that a string attribute is the same across all tickets in a match.
+ **Difference rule**: ensures that the absolute difference for a number attribute between any two tickets in a match is less than a configured maximum difference.
+ **Set intersection rule**: ensures that for a given attribute that is a list of strings, all tickets in a match share at least as many values as is configured.
+ **Match total rule**: ensures that the sum of a number attribute across all players in a match is within a configured range.
+ **Region selection rule**: ensures that the latency to a common data center for all users of the match is less than a configured max value.
+ **Team size balance rule**: ensures that teams included in a match contain similar member counts.
+ **Team difference rule**: ensures that teams included in a match are within a configured difference for a specific attribute (such as skill).
+ **Team ticket size similarity rule**: enforces that the number of large parties is equal to the number of teams, or is zero.

Rules can be defined to enforce basic functionality, such as matching players with the same map, game mode or game version. More advanced uses allow constraints to relax over time or become disabled after some time. Such rules
are useful for skill-based matchmaking. Visit Game Manager for more in-depth documentation on these options.

For more information on specific flows from either your game client or service, see the following documentation.  

### Quickstart guide

+ [Quickstart - Client SDK](quickstart-client-sdk.md)
+ [Quickstart - REST API](quickstart.md)

### Configuration

+ [Configuring matchmaking queues](config-queues.md)
+ [Matchmaking scenario and configuration examples](config-examples.md)

### Tutorials

+ [Specifying attributes with your tickets](ticket-attributes.md)
+ [Displaying queue statistics in your title](display-statistics.md)
+ [Integrating with PlayFab Multiplayer Servers](multiplayer-servers.md)
+ [Handling common error cases](error-cases.md)
+ [Workaround for peer-to-peer connection](peer-to-peer.md)
+ [Using server backfill tickets](backfill-tickets.md)
+ [Analyzing Your Matchmaking Queue Usage](usage.md)

### SDKs and Tools

+ [Matchmaking API Reference](xref:titleid.playfabapi.com.multiplayer.matchmaking)
<!-- + [Matchmaking Admin API Reference](xref:titleid.playfabapi.com.multiplayer.matchmakingadmin) -->
+ [PlayStream Events](../../../api-references/events/index.md)
    + [matchmaking_match_found](../../../api-references/events/matchmaking-match-found.md)
    + [matchmaking_ticket_completed](../../../api-references/events/matchmaking-ticket-completed.md)

