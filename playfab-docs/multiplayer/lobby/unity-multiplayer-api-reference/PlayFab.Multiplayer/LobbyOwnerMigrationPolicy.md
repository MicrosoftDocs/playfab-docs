---
author: vicodex
title: LobbyOwnerMigrationPolicy
description: LobbyOwnerMigrationPolicy members
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# LobbyOwnerMigrationPolicy

The available policies the lobby service can use to migrate lobby ownership between members.

```csharp
public enum LobbyOwnerMigrationPolicy : uint
```

## Values

| name | value | description |
| --- | --- | --- |
| Automatic | `0` | Once the lobby owner is disconnected, a new owner is chosen at random from the set of connected members. |
| Manual | `1` | Once the lobby owner is disconnected, any member may elect themselves the new owner. |
| None | `2` | At any point, any member may elect themselves the owner of the lobby, regardless of the state of the current owner. |
| Server | `3` | The server is the owner and owner migration is not possible. |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

