---
author: vicodex
title: PlayFabMultiplayerManager.Get().SendChatMessageToAllPlayers
description: Broadcasts a text message to all players.
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 06/22/2020
---

# SendChatMessageToAllPlayers

Broadcasts a text message to all players. This API sends a message such that it is guaranteed to arrive and in sequential order.

## Syntax

```csharp
public void PlayFabMultiplayerManager.Get().SendChatMessageToAllPlayers(string message);
```

### Parameters

**message** string

The contents of the chat message.

## Remarks

```csharp
PlayFabMultiplayerManager playFabMultiplayerManager = PlayFabMultiplayerManager.Get();
playFabMultiplayerManager.SendChatMessageToAllPlayers("Hello");
```

## Return value

None.
