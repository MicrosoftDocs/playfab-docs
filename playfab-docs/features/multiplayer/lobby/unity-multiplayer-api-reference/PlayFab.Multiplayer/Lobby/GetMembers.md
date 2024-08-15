---
author: vicodex
title: Lobby.GetMembers
description: Lobby.GetMembers
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# Lobby.GetMembers method

Gets the list of PlayFab entities currently joined to the lobby as members.

```csharp
public IList<PFEntityKey> GetMembers()
```

## Return Value

The list of PlayFab entities currently joined to the lobby as members.

## Remarks

If this lobby object is still in the process of asynchronously being created or joined, via a call to either [`CreateAndJoinLobby`](../PlayFabMultiplayer/CreateAndJoinLobby.md) or [`JoinLobby`](../PlayFabMultiplayer/JoinLobby.md) respectively, this method will return no members.

## See Also

* class [PFEntityKey](../PFEntityKey.md)
* class [Lobby](../Lobby.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

