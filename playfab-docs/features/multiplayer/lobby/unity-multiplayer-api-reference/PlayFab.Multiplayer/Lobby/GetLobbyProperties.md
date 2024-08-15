---
author: vicodex
title: Lobby.GetLobbyProperties
description: Lobby.GetLobbyProperties
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# Lobby.GetLobbyProperties method

Get the dictionary of lobby property keys and values

```csharp
public IDictionary<string, string> GetLobbyProperties()
```

## Return Value

The dictionary of lobby property keys and values

## Remarks

Lobby properties are only visible to members of the lobby.

This constructs a new Dictionary upon each API call so it should not be called with high frequency

If this lobby object is still in the process of asynchronously being created or joined via a call to [`CreateAndJoinLobby`](../PlayFabMultiplayer/CreateAndJoinLobby.md) or [`JoinLobby`](../PlayFabMultiplayer/JoinLobby.md), this method returns no keys.

## See Also

* class [Lobby](../Lobby.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

