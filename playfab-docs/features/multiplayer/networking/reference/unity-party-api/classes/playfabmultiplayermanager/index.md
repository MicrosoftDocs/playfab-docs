---
author: vicodex
title: Class PlayFabMultiplayerManager
description: PlayFabMultiplayerManager members
ms.author: victorku
ms.topic: reference
ms.prod: playfab
ms.date: 06/22/2020
---

# Class PlayFabMultiplayerManager

## Properties

| Name | Description |
| --- | --- |
| [LocalPlayer](properties/playfabunitylocalplayer.md) | Gets the local player for this client. |
| [LogLevel](properties/playfabunityloglevel.md) | Gets and sets the amount of logging currently enabled. |
| [NetworkId](properties/playfabunitynetworkid.md) | Gets the connection string of the current network to which the client is connected. This connection string can be passed to other clients to connect to the network. The NetworkId is populated after the OnNetworkJoined event fires.
|
| [RemotePlayers](properties/playfabunityremoteplayers.md) | Gets the collection of remote players currently joined to the network. |
| [State](properties/playfabunitystate.md) | Gets the current state of the multiplayer manager. |

## Methods

| Name | Description |
| --- | --- |
| [SendChatMessage](methods/partyunitysendchatmessage.md) | Sends a chat message to a specific list of recipients. |
| [SendChatMessageToAllPlayers](methods/partyunitysendchatmessagetoallplayers.md) | Broadcasts a text message to all players. This API sends a message such that it is guaranteed to arrive and in sequential order. |
| [CreateAndJoinNetwork](methods/playfabunitycreateandjoinnetwork.md) | Creates a network for players to join. After the player joins the network, they can send the other players that are on the network chat and data messages. |
| [Get](methods/playfabunityget.md) | Returns a reference to the PlayFabMultiplayerManager singleton instance. |
| [JoinNetwork](methods/playfabunityjoinnetwork.md) | Joins this player to the specified network. |
| [LeaveNetwork](methods/playfabunityleavenetwork.md) | Causes the local player to leave the network. |
| [SendDataMessage](methods/playfabunitysenddatamessage.md) |Sends a data message to the specified players using the specified delivery options. The most advanced method for sending data messages, allowing the developer more control over how the message is sent. |
| [SendDataMessageToAllPlayers](methods/playfabunitysenddatamessagetoallplayers.md) | Broadcasts a data message to all players. |

## Events

| Name | Description |
| --- | --- |
| [OnChatMessageReceived](events/partyunityonchatmessagereceived.md) | Occurs when a chat message is received. |
| [OnDataMessageReceived](events/partyunityondatamessagereceived.md) | Occurs when a data message is received. |
| [OnDataMessageReceived](events/partyunityoneatamessagereceived.md) | Occurs when a data message is received. |
| [OnErrorEventHandler](events/partyunityonerroreventhandler.md) | Occurs when there is an error. |
| [OnNetworkChanged](events/partyunityonnetworkchanged.md) | Occurs when the Network changes. When this event fires you must move all the players to the new network, specified in the newNetworkID so the players can continue to communicate. |
| [OnNetworkJoined](events/partyunityonnetworkjoined.md) | Occurs when the local player joins the network. |
| [OnNetworkLeft](events/partyunityonnetworkleft.md) | Occurs when the local player leaves the network. |
| [OnRemotePlayerJoined](events/partyunityonremoteplayerjoined.md) | Occurs when a remote player joins the network. |
| [OnRemotePlayerLeft](events/partyunityonremoteplayerleft.md) | Occurs when a remote player leaves the network. |
