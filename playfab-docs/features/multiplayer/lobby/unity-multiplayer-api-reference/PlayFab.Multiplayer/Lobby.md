---
author: nassosterz-ms
title: Lobby
description: Lobby members
ms.author: aterzakis
ms.topic: reference
ms.service: playfab
ms.date: 08/23/2023
---

# Class Lobby

```csharp
public class Lobby
```

## Properties

| name | description |
| --- | --- |
| [AccessPolicy](Lobby/AccessPolicy.md) | Gets the access policy of the lobby. |
| [ConnectionString](Lobby/ConnectionString.md) | Gets the default connection string associated with the lobby. |
| [Id](Lobby/Id.md) | Gets the ID of the Lobby. |
| [MaxMemberCount](Lobby/MaxMemberCount.md) | Gets the max member count of the lobby. |
| [MembershipLock](Lobby/MembershipLock.md) | Gets whether the lobby's membership is locked. |
| [OwnerMigrationPolicy](Lobby/OwnerMigrationPolicy.md) | Gets the owner migration policy of the lobby. |

## Methods

| name | description |
| --- | --- |
| [AddMember](Lobby/AddMember.md) | Add a local user as a member to the lobby. (two methods) |
| [ForceRemoveMember](Lobby/ForceRemoveMember.md) | Forcibly remove an entity from the lobby. |
| [GetLobbyProperties](Lobby/GetLobbyProperties.md) | Get the dictionary of lobby property keys and values |
| [GetMemberConnectionStatus](Lobby/GetMemberConnectionStatus.md) | Determines a member's connection status to the notification service. |
| [GetMemberProperties](Lobby/GetMemberProperties.md) | Get the dictionary of member property keys and values for a specific member |
| [GetMembers](Lobby/GetMembers.md) | Gets the list of PlayFab entities currently joined to the lobby as members. |
| [GetSearchProperties](Lobby/GetSearchProperties.md) | Get the dictionary of search property keys and values |
| [Leave](Lobby/Leave.md) | Request one local user to leave the lobby. (two methods) |
| [LeaveAllLocalUsers](Lobby/LeaveAllLocalUsers.md) | Request all local users to leave the lobby. |
| [PostUpdate](Lobby/PostUpdate.md) | Post an update to the lobby. (six methods) |
| [SendInvite](Lobby/SendInvite.md) | Send an invite to this lobby from the local user to the invited entity. (two methods) |
| [ServerDeleteLobby](Lobby/ServerDeleteLobby.md) | Delete a lobby on behalf of the game_server entity that owns the lobby. |
| [ServerPostUpdate](Lobby/ServerPostUpdate.md) | Post an update to the lobby as the server-owner. |
| [TryGetOwner](Lobby/TryGetOwner.md) | Tries to get the current owner of the lobby. Returns false and sets owner to null if there is no owner on this Lobby |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)
