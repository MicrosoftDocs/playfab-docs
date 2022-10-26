---
author: vicodex
title: LobbyArrangedJoinConfiguration class
description: LobbyArrangedJoinConfiguration members
ms.author: victorku
ms.topic: reference
ms.service: playfab
ms.date: 11/23/2021
---

# Class LobbyArrangedJoinConfiguration

The initial configuration data used when joining an arranged lobby.

```csharp
public class LobbyArrangedJoinConfiguration
```

## Constructors

| name | description |
| --- | --- |
| [LobbyArrangedJoinConfiguration](LobbyArrangedJoinConfiguration/LobbyArrangedJoinConfiguration.md) | The default constructor. |

## Properties

| name | description |
| --- | --- |
| [AccessPolicy](LobbyArrangedJoinConfiguration/AccessPolicy.md) | The access policy for the lobby, if the joiner is the first member in the lobby. |
| [MaxMemberCount](LobbyArrangedJoinConfiguration/MaxMemberCount.md) | The maximum number of members allowed in the lobby, if joiner is the first member in the lobby. |
| [MemberProperties](LobbyArrangedJoinConfiguration/MemberProperties.md) | The initial member properties for the joiner of the lobby. |
| [OwnerMigrationPolicy](LobbyArrangedJoinConfiguration/OwnerMigrationPolicy.md) | The owner migration policy for the lobby, if the joiner is the first member in the lobby. |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

