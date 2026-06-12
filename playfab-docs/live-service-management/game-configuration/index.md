---
title: Game Server Configuration overview
author: m-kdearnley
description: Learn about Game Server Configuration in PlayFab, which provides server-side key/value and file storage for your title's game server entities.
ms.author: kdearnley
ms.date: 06/11/2026
ms.topic: overview
ms.service: azure-playfab
keywords: playfab, game configuration, entity, game server, title data
ms.localizationpriority: medium
---

# Game Server Configuration

Game Server Configuration provides server-side storage for data scoped to your title's `game_server` entity. It uses the Entity Objects and Entity Files APIs to store and retrieve JSON objects and binary files that configure game server behavior.

## What belongs in Game Server Configuration

Use Game Server Configuration for data that:

- Applies to your game servers rather than individual players
- Needs to be read by server-authoritative game logic
- Includes configuration such as match settings, server parameters, or feature flags that aren't per-player

## How it works

Game Configuration uses the same underlying APIs as other entity data storage in PlayFab:

- **Entity Objects** — store small JSON-serializable key/value pairs on the `game_server` entity using [SetObjects](/rest/api/playfab/data/object/set-objects) and [GetObjects](/rest/api/playfab/data/object/get-objects)
- **Entity Files** — store larger binary or text files on the `game_server` entity using the [File APIs](/rest/api/playfab/data/file)

To authenticate as a `game_server` entity, call [AuthenticateGameServerWithCustomId](/rest/api/playfab/authentication/authentication/authenticate-game-server-with-custom-id) as a title entity.

## Related features

For a comparison of all entity storage features, see [Entity Objects](entities/entity-objects.md#related-features).

## View in Game Manager

You can view and manage Game Configuration data in Game Manager under the entity browser by selecting a `game_server` entity.

## See also

- [Entity Programming Model](entities/index.md)
- [Entity Objects](entities/entity-objects.md)
- [Entity Files](entities/entity-files.md)
- [Title Data](titledata/index.md)
