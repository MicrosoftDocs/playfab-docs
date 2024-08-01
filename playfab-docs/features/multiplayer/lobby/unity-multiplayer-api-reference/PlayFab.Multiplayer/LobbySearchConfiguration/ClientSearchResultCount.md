---
author: vicodex
title: LobbySearchConfiguration.ClientSearchResultCount
description: LobbySearchConfiguration.ClientSearchResultCount
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# LobbySearchConfiguration.ClientSearchResultCount property

An optional value which, when specified, will limit the number of results provided in the completion response.

```csharp
public uint? ClientSearchResultCount { get; set; }
```

## Remarks

This value may only be specified when [`FindLobbies`](../PlayFabMultiplayer/FindLobbies.md) is called with a client-entity.

This value can be no higher than `PlayFabMultiplayer.LobbyClientRequestedSearchResultCountUpperLimit`.

When not specified, the limit on the number of search results is service-defined but will be no greater than `PlayFabMultiplayer.LobbyClientRequestedSearchResultCountUpperLimit`.

## See Also

* class [LobbySearchConfiguration](../LobbySearchConfiguration.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

