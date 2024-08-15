---
author: vicodex
title: LobbyMemberRemovedReason
description: LobbyMemberRemovedReason members
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# LobbyMemberRemovedReason

Reasons why a member was removed from a lobby.

```csharp
public enum LobbyMemberRemovedReason : uint
```

## Values

| name | value | description |
| --- | --- | --- |
| LocalUserLeftLobby | `0` | The local user is being removed because the title called [`Leave`](./Lobby/Leave.md). |
| LocalUserForciblyRemoved | `1` | The local user entity was forcibly removed by the owner. |
| RemoteUserLeftLobby | `2` | The remote user has been removed from the lobby. It is unspecified why they are being removed. |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

