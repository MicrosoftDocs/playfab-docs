---
author: raymondcha
title: Lobby.GetServerProperties
description: Lobby.GetServerProperties
ms.author: raymondcha
ms.topic: reference
ms.service: azure-playfab
ms.date: 4/19/2024
---

# Lobby.GetServerProperties method

Get the dictionary of server property keys and values.

```csharp
public IDictionary<string, string> GetServerProperties()
```

## Return Value

The dictionary of lobby property keys and values

## Remarks

If this lobby isn't a client-owned lobby, no property value is returned.

This constructs a new Dictionary upon each API call so it shouldn't be called with high frequency.

If this lobby object is still in the process of asynchronously being joined via a call to [PlayFabMultiplayer.JoinLobbyAsServer()](../PlayFabMultiplayer.PlayFabMultiplayerServer/JoinLobbyAsServer.md), this method returns no keys.

## See Also

* class [Lobby](../Lobby.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

