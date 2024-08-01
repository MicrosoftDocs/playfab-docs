---
author: vicodex
title: LobbySearchFriendsFilter.IncludeXboxFriendsToken
description: LobbySearchFriendsFilter.IncludeXboxFriendsToken
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# LobbySearchFriendsFilter.IncludeXboxFriendsToken property

An Xbox Live token that, when provided, includes the player's Xbox Live friends list if their PlayFab account is linked to their Xbox Live account.

```csharp
public string IncludeXboxFriendsToken { get; set; }
```

## Remarks

To retrieve this token, make a POST request to "https://playfabapi.com" with an empty request body using one of the GetTokenAndSignature APIs provided by Xbox Live.

GetTokenAndSignature APIs are provided natively as part of the Microsoft Game Core Development Kit (GDK). On all other platforms, these APIs are provided via the Xbox Authentication Library API (XAL).

## See Also

* class [LobbySearchFriendsFilter](../LobbySearchFriendsFilter.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)
