---
author: vicodex
title: LobbyArrangedJoinConfiguration class
description: LobbyArrangedJoinConfiguration members
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# Class LobbyArrangedJoinConfiguration

The initial configuration data used when joining an arranged lobby.

```csharp
public class LobbyArrangedJoinConfiguration
```

## Public Members

| name | description |
| --- | --- |
| [LobbyArrangedJoinConfiguration](LobbyArrangedJoinConfiguration/LobbyArrangedJoinConfiguration.md)() | The default constructor. |
| [AccessPolicy](LobbyArrangedJoinConfiguration/AccessPolicy.md) { get; set; } | The access policy for the lobby, if the joiner is the first member in the lobby. |
| [MaxMemberCount](LobbyArrangedJoinConfiguration/MaxMemberCount.md) { get; set; } | The maximum number of members allowed in the lobby, if joiner is the first member in the lobby. |
| [MemberProperties](LobbyArrangedJoinConfiguration/MemberProperties.md) { get; set; } | The initial member properties for the joiner of the lobby. |
| [OwnerMigrationPolicy](LobbyArrangedJoinConfiguration/OwnerMigrationPolicy.md) { get; set; } | The owner migration policy for the lobby, if the joiner is the first member in the lobby. |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

