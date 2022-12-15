---
author: vicodex
title: LobbyDataUpdate class
description: LobbyDataUpdate members
ms.author: victorku
ms.topic: reference
ms.service: playfab
ms.date: 11/23/2021
---

# Class LobbyDataUpdate

A request to make an update to the shared portion of the lobby on behalf of a member.

```csharp
public class LobbyDataUpdate
```

## Constructors

| name | description |
| --- | --- |
| [LobbyDataUpdate](LobbyDataUpdate/LobbyDataUpdate.md) | The default constructor. |

## Properties

| name | description |
| --- | --- |
| [AccessPolicy](LobbyDataUpdate/AccessPolicy.md) | An optional, updated access policy for this lobby. |
| [LobbyProperties](LobbyDataUpdate/LobbyProperties.md) | The lobby properties to update. |
| [MaxMemberCount](LobbyDataUpdate/MaxMemberCount.md) | An optional, updated capacity for the number of members in this lobby. |
| [MembershipLock](LobbyDataUpdate/MembershipLock.md) | An optional update to the membership lock on this lobby. |
| [NewOwner](LobbyDataUpdate/NewOwner.md) | An optional, new owner of the lobby. |
| [SearchProperties](LobbyDataUpdate/SearchProperties.md) | The search properties to update. |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

