---
author: vicodex
title: PlayFabMultiplayerManager.Get().SendDataMessage
description: Sends a data message to the specified players.
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 06/22/2020
---

# SendDataMessage


## SendDataMessage(buffer, recipients, deliveryOption);

Sends a data message to the specified players. This is a more advanced overload for sending data messages, allowing the developer more control over how the message is sent.

## Syntax


```csharp
public void PlayFabMultiplayerManager.Get().SendDataMessage(byte[] buffer, IEnumerable<PlayFabPlayer> recipients, DeliveryOption deliveryOption);
```

### Parameters

### Parameters

**buffer** IntPtr

A pointer to the buffer containing the data to send.

**recipients** IEnumerable\<PlayFabPlayer>

The players to send the data message to. If the collection of players is empty, the data message will be broadcast to all players.

**deliveryOption** DeliveryOption

Options specifying how to deliver the message.

### Return value

None.

## SendDataMessage(buffer, bufferSize, recipients, deliveryOption);

Sends a data message to the specified players using the specified delivery options. The most advanced method for sending data messages, allowing the developer more control over how the message is sent.

### Syntax

```csharp
public void PlayFabMultiplayerManager.Get().SendDataMessage(byte[] buffer, IEnumerable<PlayFabPlayer> recipients, DeliveryOption deliveryOption);
```

### Parameters

**buffer** IntPtr

A pointer to the buffer containing the data to send.

**bufferSize** uint

The size of the buffer.

**recipients** IEnumerable\<PlayFabPlayer>

The players to send the data message to. If the collection of players is empty, the data message will be broadcast to all players.

**deliveryOption** DeliveryOption

Options specifying how to deliver the message.

## Sample

```csharp
...
byte[] buffer = Encoding.ASCII.GetBytes("Hello");
IntPtr unmanagedPointer = Marshal.AllocHGlobal(buffer.Length);
Marshal.Copy(buffer, 0, unmanagedPointer, buffer.Length);
PlayFabMultiplayerManager.Get().SendDataMessage(unmanagedPointer, (uint)buffer.Length, remotePlayers, DeliveryOption.Guaranteed);
Marshal.FreeHGlobal(unmanagedPointer);
...
```

## Return value

None.
