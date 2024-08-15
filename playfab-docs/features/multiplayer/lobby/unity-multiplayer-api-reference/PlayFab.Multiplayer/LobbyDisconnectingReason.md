---
author: vicodex
title: LobbyDisconnectingReason
description: LobbyDisconnectingReason members
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# LobbyDisconnectingReason

Reasons the client no longer has access to the Lobby.

```csharp
public enum LobbyDisconnectingReason : uint
```

## Values

| name | value | description |
| --- | --- | --- |
| NoLocalMembers | `0` | The client is no longer connected to the lobby because none of the client's local entities are members. |
| LobbyDeleted | `1` | The client is being disconnected from the lobby because the lobby's server owner has deleted the lobby. |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)
