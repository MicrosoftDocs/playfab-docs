---
author: vicodex
title: LobbyCreateConfiguration class
description: LobbyCreateConfiguration members
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# Class LobbyCreateConfiguration

The initial configuration data used when creating a lobby.

```csharp
public class LobbyCreateConfiguration
```

## Public Members

| name | description |
| --- | --- |
| [LobbyCreateConfiguration](LobbyCreateConfiguration/LobbyCreateConfiguration.md)() | The default constructor. |
| [AccessPolicy](LobbyCreateConfiguration/AccessPolicy.md) { get; set; } | The access policy for the new lobby. |
| [LobbyProperties](LobbyCreateConfiguration/LobbyProperties.md) { get; set; } | The initial lobby properties for the new lobby. |
| [MaxMemberCount](LobbyCreateConfiguration/MaxMemberCount.md) { get; set; } | The maximum number of members allowed in the new lobby. |
| [OwnerMigrationPolicy](LobbyCreateConfiguration/OwnerMigrationPolicy.md) { get; set; } | The owner migration policy for the new lobby. |
| [SearchProperties](LobbyCreateConfiguration/SearchProperties.md) { get; set; } | The initial search properties for the new lobby. |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

