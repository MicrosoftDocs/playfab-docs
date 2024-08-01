---
author: vicodex
title: PlayFabMultiplayer.OnLobbyUpdatedHandler
description: PlayFabMultiplayer.OnLobbyUpdatedHandler
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.OnLobbyUpdatedHandler delegate

Handler for when a lobby was updated.

This state change signifies that the lobby has updated and provides hints as to which values have changed. Multiple updates may be provided by a single call to [`ProcessLobbyStateChanges`](./PlayFabMultiplayer/ProcessLobbyStateChanges.md). All state reflected by these updates will become available simultaneously when ProcessLobbyStateChanges() is called, so the updates can be reconciled either individually or as a batch.

```csharp
public delegate void OnLobbyUpdatedHandler(Lobby lobby, bool ownerUpdated, bool maxMembersUpdated, 
    bool accessPolicyUpdated, bool membershipLockUpdated, IList<string> updatedSearchPropertyKeys, 
    IList<string> updatedLobbyPropertyKeys, IList<LobbyMemberUpdateSummary> memberUpdates);
```

| parameter | description |
| --- | --- |
| lobby | The lobby involved with the operation. |
| ownerUpdated | A flag indicating if the lobby's owner was updated. |
| maxMembersUpdated | A flag indicating if the maximum number of members allowed in the lobby has been updated. |
| accessPolicyUpdated | A flag indicating if the lobby's access policy was updated. |
| membershipLockUpdated | A flag indicating if the lobby's membership lock has updated. |
| updatedSearchPropertyKeys | The keys of the search properties which have been updated. |
| updatedLobbyPropertyKeys | The keys of the lobby properties which have been updated. |
| memberUpdates | The set of member updates. |

## See Also

* class [Lobby](./Lobby.md)
* class [LobbyMemberUpdateSummary](./LobbyMemberUpdateSummary.md)
* class [PlayFabMultiplayer](./PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

