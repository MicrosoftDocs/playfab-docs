---
author: vicodex
title: LobbySearchConfiguration.SortString
description: LobbySearchConfiguration.SortString
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# LobbySearchConfiguration.SortString property

The query string used to sort the lobbies returned in the search results.

```csharp
public string SortString { get; set; }
```

## Remarks

This string is formatted in an OData-like order-by syntax: a comma-separated list of search property keys with an optional specifier to sort in either ascending or descending order.

To specify ascending order, use the "asc" operator after the associated search property key. To specify descending order, use the "desc" operator after the associated search property key.

Additionally, a special sorting moniker, distance, is supported to enable sorting by closest distance from some numeric value. For example, "distance{number_key10=5} asc" will sort the results so that lobbies who have their "number_key10" search property closer to the value "5" will return earlier in the search results.

This string cannot exceed 100 characters.

Example: "string_key1 asc,memberCount desc"

## See Also

* class [LobbySearchConfiguration](../LobbySearchConfiguration.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)
