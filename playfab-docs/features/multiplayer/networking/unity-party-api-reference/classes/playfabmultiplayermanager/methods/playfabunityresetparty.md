---
author: nassosterz-ms
title: PlayFabMultiplayerManager.Get().ResetParty
description: Resets state of Party.
ms.author: aterzakis
ms.topic: reference
ms.prod: playfab
ms.date: 10/09/2022
---

# ResetParty

If PlayFabMultiplayerManager is connected to a network, then the object leaves the network. Moreover, cleans up and re-initializes all resources related to Party and the corresponding PlayFabMultiplayerManager object. If the object was connected to a network, attempts to reconnect to the same network.

## Syntax

```csharp
public void PlayFabMultiplayerManager.Get().ResetParty();
```

### Parameters

None.

### Return value

None.
