---
author: vicodex
title: PlayFabMultiplayer.OnForceRemoveMemberCompletedHandler
description: PlayFabMultiplayer.OnForceRemoveMemberCompletedHandler
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.OnForceRemoveMemberCompletedHandler delegate

Handler for when the operation started by a previous call to [`ForceRemoveMember`](./Lobby/ForceRemoveMember.md) completed.

```csharp
public delegate void OnForceRemoveMemberCompletedHandler(Lobby lobby, PFEntityKey targetMember, 
    int result);
```

| parameter | description |
| --- | --- |
| lobby | The lobby involved with the operation. |
| targetMember | The member entity which is the target to the force remove. |
| result | Indicates that the ForceRemoveMember operation succeeded or provides the reason that it failed. |

## See Also

* class [Lobby](./Lobby.md)
* class [PFEntityKey](./PFEntityKey.md)
* class [PlayFabMultiplayer](./PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

