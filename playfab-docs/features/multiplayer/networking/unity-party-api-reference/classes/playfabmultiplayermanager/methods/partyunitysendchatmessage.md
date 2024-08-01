---
author: vicodex
title: PlayFabMultiplayerManager.Get().SendChatMessage
description: Sends a chat message to a specific list of players.
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 06/22/2020
---

# SendChatMessage

Sends a chat message to a specific list of players (recipients).

## Syntax

```csharp
public void PlayFabMultiplayerManager.Get().SendChatMessage(string message, IEnumerable<PlayFabPlayer> recipients, DeliveryOption TBD);
```

### Parameters

**message**  string

The contents of the chat message.

**recipients** IEnumerable\<PlayFabPlayer>

The recipients of the chat message.

**TBD** DeliveryOption

## Remarks

```csharp
PlayFabMultiplayerManager playFabMultiplayerManager = PlayFabMultiplayerManager.Get();
PlayFabMultiplayerManager.Get().SendChatMessage("Hello", targetPlayers, DeliveryOption.Guaranteed);
```

### Return value

None.
