---
title: Lobby lifetime and expiration
author: kkline
description: Learn about the lifetime of lobbies, including how different lobby types and connection states affect lobby expiration.
ms.author: kkline
ms.date: 02/27/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, lobby, matchmaking, ttl, lifetime, expiration
ms.localizationpriority: medium
---

# Lobby lifetime and expiration

This article explains how lobbies expire and are deleted. Lobby lifetime depends on the lobby type, connection state, and member activity. Understanding these behaviors helps you design your game to avoid unexpected lobby loss and keep search results clean.

## Overview

PlayFab Lobbies are temporary groupings of players. Every lobby has a time to live (TTL) that determines when it will be automatically deleted if left idle. The TTL is reset whenever there's activity on the lobby, such as a member joining, leaving, or updating lobby data.

The two most important factors that determine how long a lobby lives are:

* **Lobby type**: Whether the lobby is client-owned or server-owned.
* **Connection state**: Whether members (and servers) are connected through real-time notifications.

## Default lobby lifetime

When a lobby is created, it's assigned a default TTL of **1 hour**. Each time the lobby is updated&mdash;through member joins, data updates, or other operations&mdash;the TTL is refreshed back to its full duration.

For lobbies that use real-time notifications (connections), the TTL is extended to **4 hours** when a member connects. This longer TTL accounts for the fact that connected lobbies are actively monitored through the connection system and don't need to expire as quickly.

> [!NOTE]
> The lobby TTL resets on every lobby operation. A lobby that is actively being used will not expire due to TTL alone.

## How connections affect lobby lifetime

Lobbies that use [real-time notifications](lobby-and-matchmaking-real-time-notifications.md) track member connections. The connection state of members directly impacts the lobby's lifetime and search visibility.

### Connected lobbies

When at least one member is connected to a client-owned lobby, the lobby remains searchable and has a maximum idle TTL of **4 hours**. As long as the lobby continues to receive updates or connection activity, the TTL continues to reset.

### Disconnected lobbies

When all members disconnect from a client-owned lobby, two things happen:

1. **The lobby is hidden from search.** This prevents other players from discovering a lobby that may be abandoned.
2. **The lobby TTL is reduced to 1 minute.** The lobby enters a brief grace period before deletion.

If a member reconnects during this grace period, the lobby is restored to full visibility and its TTL is extended back to 4 hours.

## Lifetime behavior by lobby type

Client-owned and server-owned lobbies have different expiration behaviors.

### Client-owned lobbies

| Scenario | Behavior |
|----------|----------|
| Active with connected members | TTL is 4 hours, reset on each operation. Lobby is searchable. |
| Active without connections | TTL is 1 hour, reset on each operation. Lobby is searchable. |
| Owner disconnects | Owner migration is triggered per the __ownerMigrationPolicy__. No direct impact on TTL. |
| All members disconnect | Lobby is hidden from search. TTL is reduced to 1 minute. |
| Member reconnects after all disconnected | Lobby becomes searchable again. TTL is restored to 4 hours. |
| Last member leaves | Lobby is deleted immediately. |

For more information on what happens when an owner disconnects, see [Ownership changes](ownership-changes.md).

### Server-owned lobbies

| Scenario | Behavior |
|----------|----------|
| Active with connected server | TTL is 4 hours, reset on each operation. Lobby is searchable. |
| Active without connections | TTL is 1 hour, reset on each operation. Lobby is searchable. |
| Server-owner disconnects | Lobby is hidden from search. TTL is unaffected. |
| Server-owner reconnects | Lobby becomes searchable again. |
| All members disconnect | No action. The server is not a member, so member disconnections don't affect lobby lifetime. |
| Server leaves | The server can be replaced by another server claiming ownership. |

> [!IMPORTANT]
> Server-owned lobbies are not deleted when all player members leave. Only the server owner can delete a server-owned lobby, or it will expire after the TTL runs out.

## Extending lobby lifetime beyond the default TTL

The 4-hour idle TTL is intended to be the maximum ordinary expected time a lobby would be left unattended. However, some scenarios&mdash;such as server-owned lobbies waiting for players to arrive&mdash;may require longer-lived lobbies.

To keep a lobby alive beyond the default TTL, periodically update the lobby before the TTL expires. Any update operation resets the TTL. For example, a game server can update a lobby property at a regular interval to prevent the lobby from expiring.

> [!NOTE]
> Any lobby operation resets the TTL, including updating lobby properties, member properties, or search properties.

## Search visibility and expiration

Lobby expiration and search visibility are closely related but distinct concepts.

* **Hidden from search** means the lobby won't appear in [FindLobbies](find-lobbies.md) results, but it still exists and can be joined using the connection string.
* **Deleted** means the lobby no longer exists and can't be accessed.

A lobby may be hidden from search but still alive during the grace period after all members disconnect. This design protects against temporary network disruptions&mdash;if members quickly reconnect, the lobby is restored without any data loss.

## Summary

| Factor | Value |
|--------|-------|
| Default TTL (no connections) | 1 hour |
| Default TTL (with connections) | 4 hours |
| TTL after all members disconnect (client-owned) | 1 minute before deletion |
| Client-owned lobby, last member leaves | Deleted immediately |
| Server-owned lobby, server disconnects | Hidden from search, TTL unaffected |
| TTL reset trigger | Any lobby operation (join, update, leave) |

## See also

* [Create a lobby](create-a-lobby.md)
* [Ownership changes](ownership-changes.md)
* [Game servers and lobbies](lobby-server-overview.md)
* [Lobby and matchmaking real-time notifications](lobby-and-matchmaking-real-time-notifications.md)
* [Lobby properties](lobby-properties.md)
* [Find lobbies](find-lobbies.md)
