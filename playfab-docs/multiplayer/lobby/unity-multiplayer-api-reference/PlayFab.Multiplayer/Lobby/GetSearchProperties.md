---
author: vicodex
title: Lobby.GetSearchProperties
description: Lobby.GetSearchProperties
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# Lobby.GetSearchProperties method

Get the dictionary of search property keys and values

```csharp
public IDictionary<string, string> GetSearchProperties()
```

## Return Value

The dictionary of search property keys and values

## Remarks

Search properties are visible to nonmembers of the lobby as metadata, which can be used to filter and sort lobby search results.

This constructs a new Dictionary upon each API call so it shouldn't be called with high frequency

If this lobby object is still in the process of asynchronously being created or joined via a call to [`CreateAndJoinLobby`](../PlayFabMultiplayer/CreateAndJoinLobby.md) or [`JoinLobby`](../PlayFabMultiplayer/JoinLobby.md), this method returns no keys.

## See Also

* class [Lobby](../Lobby.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)
