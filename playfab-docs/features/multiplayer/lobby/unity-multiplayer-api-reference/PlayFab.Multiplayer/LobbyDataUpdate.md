---
author: vicodex
title: LobbyDataUpdate class
description: LobbyDataUpdate members
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# Class LobbyDataUpdate

A request to make an update to the shared portion of the lobby on behalf of a member.

```csharp
public class LobbyDataUpdate
```

## Public Members

| name | description |
| --- | --- |
| [LobbyDataUpdate](LobbyDataUpdate/LobbyDataUpdate.md)() | The default constructor. |
| [AccessPolicy](LobbyDataUpdate/AccessPolicy.md) { get; set; } | An optional, updated access policy for this lobby. |
| [LobbyProperties](LobbyDataUpdate/LobbyProperties.md) { get; set; } | The lobby properties to update. |
| [MaxMemberCount](LobbyDataUpdate/MaxMemberCount.md) { get; set; } | An optional, updated capacity for the number of members in this lobby. |
| [MembershipLock](LobbyDataUpdate/MembershipLock.md) { get; set; } | An optional update to the membership lock on this lobby. |
| [NewOwner](LobbyDataUpdate/NewOwner.md) { get; set; } | An optional, new owner of the lobby. |
| [SearchProperties](LobbyDataUpdate/SearchProperties.md) { get; set; } | The search properties to update. |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

