---
author: vicodex
title: PlayFabMultiplayer.OnLobbyFindLobbiesCompletedHandler
description: PlayFabMultiplayer.OnLobbyFindLobbiesCompletedHandler
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.OnLobbyFindLobbiesCompletedHandler delegate

Handler for when the operation started by a previous call to [`FindLobbies`](./PlayFabMultiplayer/FindLobbies.md) completed.

```csharp
public delegate void OnLobbyFindLobbiesCompletedHandler(IList<LobbySearchResult> searchResults, 
    PFEntityKey searchingEntity, int result);
```

| parameter | description |
| --- | --- |
| searchResults | The results returned by the search operation. |
| searchingEntity | The entity provided to the call associated with this state change. |
| result | Indicates that the search lobbies operation Succeeded or provides the reason that it failed. |

## See Also

* class [LobbySearchResult](./LobbySearchResult.md)
* class [PFEntityKey](./PFEntityKey.md)
* class [PlayFabMultiplayer](./PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

