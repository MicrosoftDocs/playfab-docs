---
author: vicodex
title: LobbyAccessPolicy
description: LobbyAccessPolicy members
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# LobbyAccessPolicy

The access policy for the lobby

```csharp
public enum LobbyAccessPolicy : uint
```

## Values

| name | value | description |
| --- | --- | --- |
| Public | `0` | The lobby is both visible in queries and any player may join, including invited players. |
| Friends | `1` | The lobby and its connection string are queryable by friends of members in this lobby. |
| Private | `2` | The lobby is not visible in queries, and a player must receive an invite to join. |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

