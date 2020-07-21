---
author: vicodex
title: PlayFabMultiplayerManager.NetworkId
description: Gets the connection string of the current network to which the client is connected.
ms.author: victorku
ms.topic: reference
ms.prod: playfab
ms.date: 06/22/2020
---

# NetworkId

Gets the connection string of the current network to which the client is connected. This connection string can be passed to other clients to connect to the network. The NetworkId is populated after the OnNetworkJoined event fires.

```csharp
public string PlayFabMultiplayerManager.NetworkId {get; }
```

## Property Value

NetworkId

[string](https://docs.microsoft.com/dotnet/api/system.string?view=netcore-3.1)
