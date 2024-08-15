---
author: nassosterz-ms
title: Lobby.ServerDeleteLobby
description: Lobby.ServerDeleteLobby
ms.author: aterzakis
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/02/2023
---

# Lobby.ServerDeleteLobby method

Delete a lobby on behalf of the game_server entity that owns the lobby.

```csharp
public void ServerDeleteLobby()
```

## Remarks

This method queues an asynchronous operation to delete the lobby on behalf of the game_server entity. On completion, a [`OnServerLobbyDeleteCompleted`](../PlayFabMultiplayer.PlayFabMultiplayerServer/OnServerLobbyDeleteCompleted.md) is provided indicating that the operation has completed.

This method does not guarantee the delete succeeds. The operation may fail due to networking or service errors. If the delete attempt fails but is retriable, the library continues to retry the delete operation. Once the operation can no longer be retried, the operation completes and a [`OnServerLobbyDeleteCompleted`](../PlayFabMultiplayer.PlayFabMultiplayerServer/OnServerLobbyDeleteCompleted.md) is provided.

While this method is present in the unified, cross-platform header, it is only implemented for Windows and, Xbox. The method returns errors on other platforms.

## See Also

* class [Lobby](../Lobby.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

