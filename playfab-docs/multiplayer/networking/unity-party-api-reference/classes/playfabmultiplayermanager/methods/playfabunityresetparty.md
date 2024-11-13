---
author: nassosterz-ms
title: PlayFabMultiplayerManager.Get().ResetParty
description: Resets state of Party.
ms.author: aterzakis
ms.topic: reference
ms.service: azure-playfab
ms.date: 10/09/2022
---

# ResetParty

If PlayFabMultiplayerManager is connected to a network, then the object leaves the network. Moreover, cleans up and reinitializes all resources related to Party and the corresponding PlayFabMultiplayerManager object. If the object was connected to a network, attempts to reconnect to the same network.

## Syntax

```csharp
public void PlayFabMultiplayerManager.Get().ResetParty();
```

### Parameters

None.

### Return value

None.

## Remarks

Under certain network conditions where connection can be sporadic, you may receive non-fatal errors while calling API such as:
SendChatMessage, SendChatMessageToAllPlayers, SendDataMessage, SendDataMessageToAllPlayers.

It is not recommended to call ResetParty API when the title receives non-fatal errors instead the title should wait for appropriate asynchronous callbacks from the library (such as OnNetworkLeft, OnRemotePlayerLeft) and take appropriate actions.

ResetParty should be used in an event when the title is unable to join an existing network with valid network descriptor or if the title is unable to create a new network.
The title should prevent a pattern where multiple clients call ResetParty simultaneously the title is experiencing errors related to Send* APIs.

