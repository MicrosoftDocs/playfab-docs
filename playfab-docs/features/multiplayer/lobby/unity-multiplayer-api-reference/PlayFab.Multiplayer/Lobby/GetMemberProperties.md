---
author: vicodex
title: Lobby.GetMemberProperties
description: Lobby.GetMemberProperties
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# Lobby.GetMemberProperties method

Get the dictionary of member property keys and values for a specific member

```csharp
public IDictionary<string, string> GetMemberProperties(PFEntityKey member)
```

| parameter | description |
| --- | --- |
| member | The member being queried. |

## Return Value

The dictionary of member property keys and values for a specific member

## Remarks

Per-member properties are only visible to members of the lobby.

This constructs a new Dictionary upon each API call so it should not be called with high frequency

If the member is still in the process of asynchronously joining this lobby either via [`CreateAndJoinLobby`](../PlayFabMultiplayer/CreateAndJoinLobby.md), [`JoinLobby`](../PlayFabMultiplayer/JoinLobby.md), or [`AddMember`](./AddMember.md), this method returns no keys.

## See Also

* class [PFEntityKey](../PFEntityKey.md)
* class [Lobby](../Lobby.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

