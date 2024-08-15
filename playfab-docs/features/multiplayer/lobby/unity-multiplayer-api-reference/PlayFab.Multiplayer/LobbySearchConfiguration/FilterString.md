---
author: vicodex
title: LobbySearchConfiguration.FilterString
description: LobbySearchConfiguration.FilterString
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# LobbySearchConfiguration.FilterString property

The query string used to filter which lobbies are returned in the search results.

```csharp
public string FilterString { get; set; }
```

## Remarks

This string is formatted in an OData-like filtering syntax.

Only the following operators are supported: "and" (logical and), "eq" (equal), "ne" (not equals), "ge" (greater than or equal), "gt" (greater than), "le" (less than or equal), and "lt" (less than).

The left-hand side of each OData logical expression should be either a search property key (e.g. string_key1, number_key3, etc) or one of the pre-defined search keys ([`LobbyMemberCountSearchKey`](../LobbyConstants/LobbyMemberCountSearchKey.md) or [`LobbyAmMemberSearchKey`](../LobbyConstants/LobbyAmMemberSearchKey.md)).

The left-hand side of each OData logical expression should be a search property key.

This string cannot exceed 500 characters.

Example: "string_key1 eq 'CaptureTheFlag' and number_key10 gt 50 and memberCount lt 5"

## See Also

* class [LobbySearchConfiguration](../LobbySearchConfiguration.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

